# frozen_string_literal: true

class PopulationsController < ApplicationController
  before_action :set_year, only: [:show]

  def index
    @population = Population.new 
  end

  def show
    @population = @year.nil? ? 0 : calculate_population
    respond_to do |format|
      format.js {render_ajax_data}
    end
  end

  def population_params
    params.require(:population).permit(:year)
  end

  private

  def set_year
    @year = population_params[:year]
    @year = @year.to_i unless @year.nil?
    @year = max_calculated_year_allowed if @year > max_calculated_year_allowed
  end

  def calculate_population
    if @year < Population.min_year                            # no previous year
      return 0
    elsif @year <= Population.max_year
      return PopulationCalculatedLinear.call(@year) 
    else
      return PopulationCalculatedExponential.call(@year)
    end
  end

  def max_calculated_year_allowed
   @max_allowed ||= ENV['MAX_CALCULATED_YEAR'].to_i
  end
end
