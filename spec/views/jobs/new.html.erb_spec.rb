require 'spec_helper'

describe "jobs/new" do
  before(:each) do
    assign(:job, stub_model(Job,
      :company_name => "MyString",
      :position_title => "MyString"
    ).as_new_record)
  end

  it "renders new job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", jobs_path, "post" do
      assert_select "input#job_company_name[name=?]", "job[company_name]"
      assert_select "input#job_position_title[name=?]", "job[position_title]"
    end
  end
end
