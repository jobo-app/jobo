# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  company_name   :string(255)
#  position_title :string(255)
#  communications :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Job < ActiveRecord::Base
  has_many :job_updates
end
