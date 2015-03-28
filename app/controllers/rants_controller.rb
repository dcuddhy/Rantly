class RantsController < ApplicationController
  before_action :owner_check, only: [:edit, :update, :destroy]

  def index
    @rants = Rant.search(params[:search])
    @user = User.all
  end

  def new
    if current_user
      @rant = Rant.new
    else
      redirect_to rants_path, notice: 'You must log in!'
    end
  end

  def show
  end

  def create
    @rant = Rant.new(params.require(:rant).permit(:title, :body))
    @rant.user_id = current_user.id
    if @rant.save
      redirect_to rants_path, notice: 'Rant was successfully created.'
    else
      render :new, notice: "You've gotta say more than that!"
    end
  end

  def edit
      @rant = Rant.find(params[:id])
  end

  def update
    @rant = Rant.find(params[:id])
    if @rant.user_id == current_user.id
      @rant.update(params.require(:rant).permit(:title, :body))
      redirect_to rants_path, notice: 'Rant was successfully edited.'
    else
      render :edit, notice: "Cannot edit this rant"
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    if @rant.user_id == current_user.id
      @rant.destroy
      redirect_to root_path, notice: "Rant was successfully destroyed."
    else
      render :edit, notice: "Cannot delete this rant"
    end
  end

  def owner_check
    @rant = current_user.rants.find_by(id: params[:id])
    if @rant.nil?
      redirect_to root_path, notice: "Who do you think you are?!"
    end
  end

end
