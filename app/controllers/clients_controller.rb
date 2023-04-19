class ClientsController < ApplicationController
##
# Ensures that a user is logged in before they can access any of the controller's actions
 
before_action :require_user

  ##
  # Retrieves all of the clients from the database and order them by their id.

  def index
    @clients = Client.all.order('id')
  end

  ##
  # Creates a new instance of the Client model.

  def new
    @client = Client.new
  end

  ##
  # Creates a new client in the database with the given parameters.
  #
  # If the client is successfully saved, the user is redirected to the clients index page.
  #
  # If the client is not successfully saved, the user is shown an error message and is
  # redirected back to the new client page.

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      if @client.errors.any?
        @client.errors.full_messages.each do |msg|
          flash[:alert] = msg
        end
      end
      render 'new'
    end
  end

  ##
  # Retrieves the client from the database with the given id.

  def edit
    @client = Client.find(params[:id])
  end

  ##
  # Updates the client in the database with the given parameters.
  #
  # If the client is successfully updated, the user is redirected to the clients index page.
  #
  # If the client is not successfully updated, the user is shown an error message and is
  # redirected back to the edit client page.

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to clients_path
    else
      if @client.errors.any?
        @client.errors.full_messages.each do |msg|
          flash[:alert] = msg
        end
      end
      render 'edit'
    end
  end

  ##
  # Deletes the client from the database with the given id.

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  private
    ##
    # Retrieves the name and city_id of the client from the parameters.

    def client_params
      params.require(:client).permit(:name, :city_id)
    end
end