class JobUpdatesController < ApplicationController
  include AngularController

  def index
    @job_updates = JobUpdate.by_job_id(params[:job_id]).newest_first
  end

  def create
    @job_update = JobUpdate.create!(params.permit(:description, :job_id, :asset))
  end

  def destroy
    JobUpdate.destroy(params[:id])
    head :ok
  end
end
