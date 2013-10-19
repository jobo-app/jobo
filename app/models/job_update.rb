# == Schema Information
#
# Table name: job_updates
#
#  id          :integer          not null, primary key
#  description :text
#  job_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class JobUpdate < ActiveRecord::Base
  belongs_to :job

  validates :description, :job, presence: true

  scope :by_job_id, -> (job_id) {
    where(job_id: job_id)
  }
end
