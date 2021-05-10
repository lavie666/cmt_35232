class CalendarsController < ApplicationController
  before_action :move_to_index, except: [:edit, :new, :update, :destroy ]
  

  def index
    @calendar = Calendar.new
  end


  def create
    @calendar = Calendar.create(calendar_params)
    if @calendar.save
      redirect_to "/clients/#{@calendar.client.id}"
    end
  end

  def show
    @calendar = Calendar.new
  end

  def destroy
    @client = Client.find(params[:id])
    @calendar = Calendar.find(params[:client_id])
    if current_user.id == @client.user.id
      @calendar.destroy
      redirect_to "/clients/#{@calendar.client.id}"
    else
      redirect_to root_path
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:date, :plan).merge(user_id: current_user.id, client_id: params[:client_id])
  end


  def move_to_index
    @client = Client.find(params[:client_id])
    if current_user.id != @client.user.id
      redirect_to root_path
    end
  end

  
end
