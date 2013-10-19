require 'spec_helper'

describe "jobs/edit" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :company_name => "MyString",
      :position_title => "MyString",
      :communications => "MyText"
    ))
  end

  it "renders the edit job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", job_path(@job), "post" do
      assert_select "input#job_company_name[name=?]", "job[company_name]"
      assert_select "input#job_position_title[name=?]", "job[position_title]"
      assert_select "textarea#job_communications[name=?]", "job[communications]"
    end
  end
end
