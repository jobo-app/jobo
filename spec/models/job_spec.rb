require 'spec_helper'

describe Job do
  it { should have_many(:job_updates) }
end
