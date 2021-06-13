class CampersController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    campers = Camper.all
    render json: campers #, status: :ok   #status ok isn't necessary here.
  end

  def show
    camper = Camper.find(params[:id]) # camper = Camper.find_by(id: params[:id]) #both work
    if camper
      render json: camper, status: :ok
    else
      render_not_found_response
    end
  end

  def create
    camper = Camper.new(camper_params)
    # byebug
    if camper.valid?
      camper.save
      render json: camper, status: :created
    else
      render json: {
        "errors": ["validation errors"],
      }, status: :unprocessable_entity
      # render json: { "errors": camper.errors.full_messages }, status: :unprocessable_entity
      #Both work
    end
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found_response
    render json: { error: "Camper not found" }, status: :not_found
  end
end
