class SearchController < ApplicationController
  include Pagy::Backend
  before_action :check_search_query, only: [:results]

  def index;end

  def results
    @search_term = params[:q]
    if params[:attr] == 'name'
      @attr = "concat(first_name, ' ', last_name)"
    else
      @attr = params[:attr]
    end
    @pagy, @user_files = pagy(UserFile.search(@attr, @search_term), items: 10)
  end

  private

  def check_search_query
    if params[:q] == ''
      flash[:alert] = 'No search term was provided!'
      redirect_back fallback_location: root_path
    end
  end
end
