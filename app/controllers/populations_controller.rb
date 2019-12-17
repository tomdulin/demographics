# frozen_string_literal: true

class PopulationsController < ApplicationController
  before_action :set_year, only: [:show]

  def index
    @population = Population.new 
  end

  def show
    @population = @year.nil? ? 0 : PopulationCalculatedLinear.call(@year)
  end

  def population_params
    params.require(:population).permit(:year)
  end

  private

  def set_year
    @year = population_params[:year]
    @year = @year.to_i unless @year.nil?
  end
end
