class Search < ActiveRecord::Base
  def create
    search = Search.new(search_params)
    redirect_to @search
  end

  private
  def search_params
    params.require(:search).permit(
        :cook_location, :cook_date, :cook_time)
  end
end
