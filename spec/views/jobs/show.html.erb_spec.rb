require 'spec_helper'

describe "jobs/show" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :company_name => "Company Name",
      :position_title => "Position Title"
    ))

    view.stub(:current_user).and_return(GuestUser.create!)
  end

  it "renders attributes in <p>" do
    render template: "jobs/show", layout: "layouts/application"
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    rendered.should match(/Position Title/)
  end
end
