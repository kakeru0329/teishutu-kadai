class GenresController < ApplicationController
  def index
  end

  def edit
  end

  private

  def genres_params
    params.require(:genre).permit(:name)
  end


end
