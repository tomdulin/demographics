# frozen_string_literal: true

class PopulationCalculatedExponential
  class << self
    include Service

    # calculates population for years after last known at an exponential growth rate of 9%
    def call(year)
      max_known_year = Population.last_known
      delta_years_to_calculate = year - max_known_year.year

      (assumed_yearly_growth ** delta_years_to_calculate * max_known_year.population).to_i 
    end

    private

    def assumed_yearly_growth
      ENV['ASSUMED_YEARLY_GROWTH'].to_f
    end
  end
end
