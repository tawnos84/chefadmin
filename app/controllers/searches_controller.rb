class SearchesController < ApplicationController
  def index
    @menus = Menu.all

    #save search parameters
    @search = Search.new
    @search.cook_location = params[:search_location]
    @search.cook_date = params[:search_date]
    @search.cook_time = params[:search_time]
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    redirect_to searches_path(search_location: @search.cook_location, search_date: @search.cook_date, search_time: @search.cook_time)
  end

  def ask
    @search = Search.new
  end

  def result
  end

  private
  def search_params
    params.require(:search).permit(
        :cook_location, :cook_time, :cook_date)
  end
end
