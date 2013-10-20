require 'spec_helper'

describe CvUpdatesController do
  # This should return the minimal set of attributes required to create a valid
  # Job. As you add validations to Job, be sure to
  # adjust the attributes here as well.
  let(:asset) { fixture_file_upload('simple.pdf') }
  let(:valid_attributes) do
    { "description" => "MyString", "job_id" => job.id, "asset" => asset }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:default_params) { { "format" => "json"} }

  let(:job) { Job.create! }
  let(:other_job) { Job.create! }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CvUpdate" do
        expect {
          post :create, default_params.merge(valid_attributes), valid_session
        }.to change(CvUpdate, :count).by(1)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested job update" do
      job_update = CvUpdate.create! valid_attributes
      expect {
        delete :destroy, default_params.merge("id" => job_update.to_param), valid_session
      }.to change(CvUpdate, :count).by(-1)
    end
  end

end
