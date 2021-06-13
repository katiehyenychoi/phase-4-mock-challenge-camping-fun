class SignupsController < ApplicationController
  def create
    # byebug
    signup = Signup.new(signup_params)
    if signup.valid?
      signup.save
      render json: signup.activity, status: :created
    else
      render json: {
               "errors": ["validation errors"],
             }, status: :unprocessable_entity
    end
  end

  private

  def signup_params
    params.permit(:time, :activity_id, :camper_id)  #we need camperid and activitiy_id bc we are returning that in line 6 through singup.activity
  end
end
