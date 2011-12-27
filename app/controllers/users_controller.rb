class UsersController < ApplicationController
  
  def new
    @title = "Sign Up"
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:success] = "Welcome to OurBull!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end
end
