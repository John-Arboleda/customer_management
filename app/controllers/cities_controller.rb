class CitiesController < ApplicationController
  ##
  # Ensures that a user is logged in before they can access any of the controller's actions

  before_action :require_user

  ##
  # Retrieves all of the cities from the database and order them by their id.

  def index
    @cities = City.all.order('id')
  end

  ##
  # Creates a new instance of the City model.

  def new
    @city = City.new
  end

  ##
  # Creates a new city in the database with the given parameters.
  #
  # If the city is successfully saved, the user is redirected to the cities index page.
  #
  # If the city is not successfully saved, the user is shown an error message and is
  # redirected back to the new city page.

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      if @city.errors.any?
        @city.errors.full_messages.each do |msg|
          flash[:alert] = msg
        end
      end
      render 'new'
    end
  end

  ##
  # Retrieves the city from the database with the given id.

  def edit
    @city = City.find(params[:id])
  end

  ##
  # Updates the city in the database with the given parameters.
  #
  # If the city is successfully updated, the user is redirected to the cities index page.
  #
  # If the city is not successfully updated, the user is shown an error message and is
  # redirected back to the edit city page.

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      redirect_to cities_path
    else
      if @city.errors.any?
        @city.errors.full_messages.each do |msg|
          flash[:alert] = msg
        end
      end
      render 'edit'
    end
  end

  ##
  # Deletes the city from the database with the given id.

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end

  private

  ##
  # Retrieves the name of the city from the parameters.

  def city_params
    params.require(:city).permit(:name)
  end
end
