require 'spec_helper'

describe Job do
  it { should have_many(:job_updates) }

  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:position_title) }
end
