class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to rants_path, notice: 'Thanks for signing up for Rantly!'
    else
      render :new
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:first_name, :last_name, :email, :password))
      redirect_to user_path(@user), notice: 'User was successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

private
  def correct_user
    @rant = current_user.rants.find_by(id: params[:id])
    redirect_to root_path, notice: "not authorized to edit the rant" if @rant.nil?
  end

end
