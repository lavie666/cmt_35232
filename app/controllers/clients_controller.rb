class ClientsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_client, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :new, :create, :search]
  
  def index
    @clients = Client.includes(:user).order("created_at DESC")
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @client.destroy
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to client_path
    end
  end

  def show
    @calendar = @client.calendars
    redirect_to root_path if current_user.id != @client.user.id
  end

  def search
    @clients = Client.search(params[:keyword])
  end


  private

  def client_params
    params.require(:client).permit(:name, :name_hiragana, :birthday, :prefecture_id, :from_id, :corporation, :drink, :food, :cigarettes, :memo, :image).merge(user_id: current_user.id)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def move_to_index
    if current_user.id != @client.user.id
      redirect_to root_path
    end
  end


end
