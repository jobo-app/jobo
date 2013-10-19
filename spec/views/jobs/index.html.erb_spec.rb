require 'spec_helper'

describe "jobs/index" do
  before(:each) do
    assign(:jobs, [
      stub_model(Job,
        :company_name => "Company Name",
        :position_title => "Position Title"
      ),
      stub_model(Job,
        :company_name => "Company Name",
        :position_title => "Position Title"
      )
    ])
  end

  it "renders a list of jobs" do
    render

    rendered.should have_css(".job", text: "Company Name", count: 2)
    rendered.should have_css(".job", text: "Position Title", count: 2)
  end
end
