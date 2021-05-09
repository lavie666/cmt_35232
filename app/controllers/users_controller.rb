class UsersController < ApplicationController
  def show
    @name = current_user.name
    @clients = current_user.clients
  end
end
