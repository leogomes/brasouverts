class CitiesController < ApplicationController
  # GET /foyers
  # GET /foyers.xml

  def index

    if params[:q]
      @cities = City.search(params[:q])
    end
  end


end
