# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  company_name   :string(255)
#  position_title :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Job < ActiveRecord::Base
  has_many :job_updates
  has_one :last_update, -> { order("created_at DESC") }, class_name: "JobUpdate"

  validates :company_name, :position_title, presence: true

  # create a new job, using bob if bob_listing_url is provided
  # (discards other arguments then)
  def self.from_bob(url)
    begin
      bob_job = Bob.fetch(url)
      new({
            position_title: bob_job.name,
            company_name: bob_job.company_name,
          })
    rescue Bob::UnprocessableHostError => e
      job = new
      job.errors.add(:base, e)
      job
    end
  end
end
