# == Schema Information
#
# Table name: job_updates
#
#  id          :integer          not null, primary key
#  description :text
#  job_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  asset       :string(255)
#

class JobUpdate < ActiveRecord::Base
  mount_uploader :asset, AssetUploader
  belongs_to :job, touch: true

  validates :description, :job, presence: true

  scope :by_job, -> (job) {
    where(job_id: job.id)
  }

  scope :newest_first, -> {
    order("created_at DESC")
  }
end
