require 'spec_helper'

describe "JobUpdates", js: true do
  let(:job) { Job.create! }

  describe "adding an update" do
    it "adds the update to the job" do
      visit job_path(job)

      within 'form' do
        fill_in "Description", with: "just an update"
        click_button "Create"
      end

      page.should have_css(".job-update", text: "just an update")
      JobUpdate.by_job_id(job.id).count.should == 1
    end
  end

  describe "removing an update" do
    let!(:job_update) { JobUpdate.create! job: job, description: "moufa" }

    it "removes the update to the job" do
      visit job_path(job)

      within all(".job-update").first do
        # assuming the only button is the delete button
        find("button").click
      end

      page.should have_no_css(".job-update", text: "moufa")
      JobUpdate.by_job_id(job.id).count.should == 0
    end
  end
end
