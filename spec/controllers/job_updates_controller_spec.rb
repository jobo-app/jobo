require 'spec_helper'

describe JobUpdatesController do
  # This should return the minimal set of attributes required to create a valid
  # Job. As you add validations to Job, be sure to
  # adjust the attributes here as well.
  let(:asset) { fixture_file_upload('simple.pdf') }
  let(:valid_attributes) do
    { "description" => "MyString", "job_id" => job.id}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {user_id: guest.id} }
  let(:guest) { GuestUser.create! }

  let(:default_params) { { "format" => "json"} }

  let(:job) { Job.by_user(guest).create! company_name: "Megadodo Publications", position_title: "Hitchhiking writer" }
  let(:other_job) { Job.by_user(guest).create! company_name: "The London Zoo", position_title: "Unambiguous monkey" }

  describe "GET index" do
    it "assigns all job's updates as @job_updates" do
      job_update = JobUpdate.create! valid_attributes
      other_job_update = JobUpdate.create! valid_attributes.merge("job_id" => other_job.id)
      get :index, default_params.merge("job_id" => job.id), valid_session
      assigns(:job_updates).should eq([job_update])
    end
  end

  describe "POST Upload" do
    let(:file) {fixture_file_upload("simple.pdf")}
    let(:job_update) {JobUpdate.create! valid_attributes}

    it "uploads a file" do
      post :upload, {id: job_update.id, asset: file}, valid_session
      job_update.reload
      expect(job_update.asset.url).to eql "/uploads/job_update/asset/#{job_update.id}/simple.pdf"
    end

    context "with an other user" do
      before do
        valid_session[:user_id] = GuestUser.create!
      end

      it "fails" do
        post :upload, {id: job_update.id, asset: file}, valid_session
        job_update.reload
        expect(job_update.asset.url).to eql nil
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new JobUpdate" do
        expect {
          post :create, default_params.merge(valid_attributes), valid_session
        }.to change(JobUpdate, :count).by(1)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested job update" do
      job_update = JobUpdate.create! valid_attributes
      expect {
        delete :destroy, default_params.merge("id" => job_update.to_param), valid_session
      }.to change(JobUpdate, :count).by(-1)
    end
  end
end
