class JobUpdatesController < ApplicationController
  include AngularController

  def index
    @job_updates = JobUpdate.by_job_id(params[:job_id]).newest_first
    respond_with @job_updates
  end

  def create
    respond_with JobUpdate.create!(params.permit(:description, :job_id))
  end

  def destroy
    JobUpdate.destroy(params[:id])
    head :ok
  end
end
