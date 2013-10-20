class JobUpdatesController < ApplicationController
  include AngularController

  before_action :require_signed_in
  before_action :fetch_job_update, only: [:upload, :destroy]
  before_action :check_user, only: [:upload, :destroy]

  def index
    job = Job.by_user(current_user).find(params[:job_id])
    @job_updates = JobUpdate.by_job(job).newest_first
  end

  def create
    job = Job.by_user(current_user).find(params[:job_id])
    @job_update = JobUpdate.by_job(job).create!(params.permit(:description, :asset))
  end

  def upload
    @job_update.asset = params[:asset]
    @job_update.save!
  end

  def destroy
    @job_update.destroy
    head :ok
  end

  private
  def fetch_job_update
    @job_update = JobUpdate.find(params[:id])
  end

  def check_user
    head :unautharized and return if @job_update.job.user != current_user
  end
end
