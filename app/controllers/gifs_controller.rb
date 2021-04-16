class GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.create(gif_params)
    if @gif.errors.any?
      render :new
    else
      flash[:success] = "Gif added!"
      redirect_to action: :index
    end
  end

  private

  def gif_params
    params.require(:gif).permit(:image)
  end
end
