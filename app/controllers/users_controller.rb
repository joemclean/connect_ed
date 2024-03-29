class UsersController < ApplicationController

  def new
  	@user = User.new
  end
  
  def create
 	@user = User.new(params[:user])
 	if @user.save
 	  redirect_to users_path
 	  flash[:success] = "User created!"
 	else
 	  render 'new'
 	end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  	  flash[:success] = "User has been updated!"
  	  redirect_to users_path
  	else
  	  flash[:error] = "Something went wrong."
  	  render 'edit'
  	end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User has been destroyed."
      redirect_to users_path
    else
      flash[:error] = "Something went wrong."
      redirect_to users_path
    end

  end
  
  private
  
    def authenticate
      deny_access unless signed_in?
    end

  
end
