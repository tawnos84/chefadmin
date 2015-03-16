class SearchesController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @search = Search.new
  end

  def create

    redirect_to searches_path
  end

  def ask
    @search = Search.new
  end

  def result
  end
end
