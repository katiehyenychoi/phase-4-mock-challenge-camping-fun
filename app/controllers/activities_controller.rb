class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    activities = Activity.all
    render json: activities
  end

  def destroy
    activity = Activity.find(params[:id])
    if activity
      activity.destroy
      render json: "Activity deleted"
    else
      render_not_found_response
    end
  end

  private

  def render_not_found_response
    render json: { error: "Activity not found" }, status: :not_found
  end
end
