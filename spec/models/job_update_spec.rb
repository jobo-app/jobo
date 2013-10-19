require 'spec_helper'

describe JobUpdate do
  it { should belong_to(:job) }

  it { should validate_presence_of(:job) }
  it { should validate_presence_of(:description) }
end
