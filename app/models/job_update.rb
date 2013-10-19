class JobUpdate < ActiveRecord::Base
  belongs_to :job

  scope :by_job_id, -> (job_id) {
    where(job_id: job_id)
  }
end
