class JobUpdatesController < ApplicationController
  include AngularController

  before_action :require_signed_in

  def index
    job = Job.by_user(current_user).find(params[:job_id])
    @job_updates = JobUpdate.by_job(job).newest_first
  end

  def create
    job = Job.by_user(current_user).find(params[:job_id])
    @job_update = JobUpdate.by_job(job).create!(params.permit(:description))
  end

  def destroy
    job_update = JobUpdate.find(params[:id])
    if job_update.job.user == current_user
      job_update.destroy
    end
    head :ok
  end
end
