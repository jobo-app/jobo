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
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Position Title".to_s, :count => 2
  end
end
