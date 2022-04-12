class PlacesController < ApplicationController
  def index
    index = Place.all
    render json: Place.all.as_json
  end

  def create
    place = Place.new(
      name: params["name"],
      address: params["address"]
    )
    if place.save
      render json: place.as_json
    else
      render json {message: place.errors.full_messages}, status: 422
    end
  end
  
  def show
    place_id = params[:id]
    place = Place.find_by(id: place_id)
    render json: place.as_json
  end


  def update
    place_id = params[:id]
    place = Place.find_by(id: place_id)

    place.name = params["name"] || place.name
    place.address = params["address"] || place.address

    if place.save
      render json: place.as_json
    else
      render json: {error: place.errors.full_messages}, status: 422
    end
  end

  def destroy
    place_id = params[:id]
    place = Place.find_by(id: place_id)
    place.destroy
    
    render json: {message: "PEOPLE LIVED THERE YOU MONSTER"}
    
  end

end
