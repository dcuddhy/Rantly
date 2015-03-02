class RantsController < ApplicationController

  before_action do
    @user = User.find(params[:user_id])
  end

  def index
    @rants = Rant.all
  end

  def new
    @rant = @user.rants.new
  end

  def show
  end

  def create
    @rant = @user.rants.new(params.require(:rant).permit(:title, :body))
    @rant.user_id = (params[:user_id])
    if @rant.save
      redirect_to user_path(@user), notice: 'Rant was successfully created.'
    else
      render :new
    end
  end

  def edit
      @rant = Rant.find(params[:id])
  end

  def update
    @rant = @user.rants.find(params[:id])
    if @rant.update(params.require(:rant).permit(:title, :body))
      redirect_to user_path(@user), notice: 'Rant was successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to user_path(@user), notice: 'Rant was successfully destroyed.'
  end


end
