require 'spec_helper'

describe "JobUpdates", js: true do
  let(:job) { Job.by_user(GuestUser.last).create! }

  before do
    visit root_path

    click_link "Sign in as Guest"
  end

  describe "adding an update" do
    it "adds the update to the job" do
      visit job_path(job)

      within 'form' do
        fill_in "Description", with: "just an update"
        click_button "Create"
      end

      wait_for_ajax

      page.should have_css(".job-update", text: "just an update")
      JobUpdate.by_job(job).count.should == 1
    end
  end

  describe "removing an update" do
    let!(:job_update) { JobUpdate.create! job: job, description: "moufa" }

    it "removes the update to the job" do
      visit job_path(job)

      within all(".job-update").first do
        click_button "Destroy"
      end

      wait_for_ajax
      page.should have_no_css(".job-update", text: "moufa")
      JobUpdate.by_job(job).count.should == 0
    end
  end
end
