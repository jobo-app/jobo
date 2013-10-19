require 'spec_helper'

describe JobUpdatesController do
  # This should return the minimal set of attributes required to create a valid
  # Job. As you add validations to Job, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "description" => "MyString", "job_id" => job.id } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:default_params) { { "format" => "json"} }

  let(:job) { Job.create! }
  let(:other_job) { Job.create! }

  describe "GET index" do
    it "assigns all job's updates as @job_updates" do
      job_update = JobUpdate.create! valid_attributes
      other_job_update = JobUpdate.create! valid_attributes.merge("job_id" => other_job.id)
      get :index, default_params.merge("job_id" => job.id), valid_session
      assigns(:job_updates).should eq([job_update])
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
