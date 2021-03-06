class SearchesController < ApplicationController
  layout "admin", only: [:index, :new, :edit]
  layout "landing", only: [:ask]

  def index
    #The Menus + Menus_found_chefs is used to ensure that only the menus for the selected location are found!
    #Optimize that code later on

    @menus = Menu.all.order(params[:sort])
    @menus_found_chefs = Menu.all.order(params[:sort])

    #save search parameters
    @search = Search.new


    @search.cook_location = "Peru"
    @search.cook_date = "31 December 2016"
    @search.cook_time = "20:00"
    @search.max_price = params[:max_price]
    @search.cuisine_type = params[:cuisine_type]
    @search.event_type = params[:event_type]

    @chefs = Chef.all

    @chefs.each do |chef|
      @menus_found_chefs -= chef.menus.all
    end

    @menus -= @menus_found_chefs

    #Filter the menus based on the price
    if(@search.max_price)
      @menus.select! { |menu| menu.price <=  @search.max_price}
    end

    if @search.cuisine_type.present?
      @menus.select! { |m| m.attributes[@search.cuisine_type] }
    end

    if @search.event_type.present?
      @menus.select! { |m| m.eventtype == @search.event_type }
    end

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
