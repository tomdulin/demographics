class PopulationsController < ApplicationController
  def index
  end

  def show
    @year = params[:year].html_safe
    @population = PopulationCalculatedLinear.call(@year)
  end

end
