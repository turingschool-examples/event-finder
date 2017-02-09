class SearchController < ApplicationController
  def index
    zip_code = params[:q]
  end
end
