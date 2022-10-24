class GamesController < ApplicationController

  def search
    if params[:keyword]
    @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  private

  def games_params
    params.require(:game).permit(:title, :release_date, :comment, :publisher)
  end

end
