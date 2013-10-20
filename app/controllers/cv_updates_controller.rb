class CvUpdatesController < ApplicationController
  include AngularController

  def create
    @cv_update = CvUpdate.create!(params.permit(:description, :job_id, :asset))
  end

  def destroy
    CvUpdate.destroy(params[:id])
    head :ok
  end
end
