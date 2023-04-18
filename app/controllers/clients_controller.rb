class ClientsController < ApplicationController
  before_action :require_user

  def index
    @clients = Client.all.order('id')
  end

  def new
    @client = Client.new
  end

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

  def edit
    @client = Client.find(params[:id])
  end

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

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  private
  def client_params
    params.require(:client).permit(:name, :city_id)
  end
end