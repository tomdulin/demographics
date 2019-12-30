class PopulationsController < ApplicationController
  before_action :set_year, only: [:show]
  before_action :max_known

  def index
    @population = Population.new
  end

  def show
    @population = @year.nil? ? 0 : calculate_population
    log
    respond_to do |format|
      format.js { render_ajax_data }
    end
  end

  def population_params
    params.require(:population).permit(:year)
  end

  def calculation_params
    params.permit(:calculation)
  end

  private

  def set_year
    @year = population_params[:year]
    @year = @year.to_i unless @year.nil?
    @year = max_calculated_year_allowed if @year > max_calculated_year_allowed
  end

  def calculate_population
    if @year < Population.min_year # no previous year
      @calculation = 4
      0
    elsif Population.where(year: @year).any?
      @calculation = 0
      Population.find_by(year: @year).population
    elsif @year <= max_known
      @calculation = 3
      PopulationCalculatedLinear.call(@year)
    elsif calculation_params[:calculation].eql?("exponential")
      @calculation = 2
      PopulationCalculatedExponential.call(@year)
    else
      @calculation = 1
      PopulationCalculatedLogistical.call(@year)
    end
  end

  def log
    TheLog.create(population: @population,
                  year: population_params[:year],
                  calculation_method: @calculation)
  end

  def max_known
    @max_known_year ||= Population.max_year
  end

  def max_calculated_year_allowed
    @max_allowed ||= ENV['MAX_CALCULATED_YEAR'].to_i
  end
end
