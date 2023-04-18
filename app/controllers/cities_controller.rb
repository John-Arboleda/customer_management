class CitiesController < ApplicationController
  before_action :require_user

  def index
    @cities = City.all.order('city_id')
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.city_id = City.last.id + 1
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

  def edit
    @city = City.find(params[:id])
  end

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

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end

  private
    def city_params
      params.require(:city).permit(:name)
    end
end
