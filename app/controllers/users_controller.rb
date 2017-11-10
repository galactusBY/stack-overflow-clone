class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect '/'
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

end
