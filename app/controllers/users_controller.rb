class UsersController < ApplicationController
before_filter :authenticate, :only => [:index, :edit, :update]
before_filter :correct_user, :only => [:edit, :update]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
   if @user.save
   sign_in @user
   flash[:success] = "Welcome to Sample App!"
   redirect_to @user
   else
   @title = 'Sign up'
   render 'new'
   end
  end
  
  def update
      @user = User.find(params[:id])
     if @user.update_attributes(params[:user])
     
     flash[:success] = "Profile Updated!"
     redirect_to @user
     else
     @title = "Edit user"
     render 'edit'
     end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  private
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
