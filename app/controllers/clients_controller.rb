class ClientsController < ApplicationController
  
  def index
    @clients = Client.all
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


  private

  def client_params
    params.require(:client).permit(:name, :name_hiragana, :birthday, :prefecture_id, :from_id, :drink, :food, :cigarettes, :memo, :image)
  end
end
