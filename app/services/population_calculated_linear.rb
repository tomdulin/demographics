class PopulationCalculatedLinear
  class << self
    include Service

    # return 0 if year is before earliest known year
    # return latest if year is after all known years
    # return previous year if year is not known
    def call(year)
      previous_year = Population.previous_known(year)

      return previous_year.population if previous_year.year == year # year entered is known

      next_year = Population.next_known(year)

      # there is no next year - unable to calculate
      return nil if next_year.nil?

      # calculate the percentage that year is between next and previous years
      mod_percentage = (year - previous_year.year).to_f / (next_year.year - previous_year.year).to_f
      delta_population = next_year.population - previous_year.population

      (delta_population * mod_percentage).to_i + previous_year.population
    end
  end
end
