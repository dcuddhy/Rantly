class RantsController < ApplicationController

  def index
    @rants = Rant.all
  end

  def new
    @rant = Rant.new
  end

  def show
  end

  def create
    @rant = Rant.new(params.require(:rant).permit(:title, :body))
    @rant.user_id = (params[:user_id])
    if @rant.save
      redirect_to rants_path, notice: 'Rant was successfully created.'
    else
      render :new
    end
  end

  def edit
      @rant = Rant.find(params[:id])
  end

  def update
    @rant = Rant.find(params[:id])
    if @rant.update(params.require(:rant).permit(:title, :body))
      redirect_to rants_path, notice: 'Rant was successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to root_path, notice: 'Rant was successfully destroyed.'
  end


end
