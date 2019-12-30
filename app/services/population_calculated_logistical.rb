class PopulationCalculatedLogistical
  class << self
    include Service

    # calculates population for years after last known at logistical growth given the following
    # p(t) = M / 1 + (M-P/P) e**-kt
    # M = Carrying Capacity
    # P = Initial population - last known population
    def call(year)
      conversion_rate = 1 + mp_over_p

      log_n = little_k ** calc_t(year)

      estimate = (carrying_capacity / (conversion_rate * log_n)).to_i

      # estimate can not exceed carrying capacity
      estimate > carrying_capacity ? carrying_capacity : estimate
    end

    private

    # how many years are we calculating Logistical growth
    def calc_t(year)
      year - initial_population.year
    end

    # this is a piece of the equation after moving all variables to calculate k 
    def little_k
      (carrying_capacity.to_f / population_after_a_year.to_f - 1) * (1/mp_over_p.to_f)
    end

    # calculate (M-P/P)
    # M = carrying capacity
    # P = last known population
    def mp_over_p
      (carrying_capacity - initial_population.population).to_f / initial_population.population.to_f
    end

    # to calculate little k and eliminate t - we calculate linearly one year after last known
    def population_after_a_year
      initial = initial_population.population
      prior = previous_population.population
      differnce_in_years = initial_population.year - previous_population.year

      initial + ((initial - prior).to_f / differnce_in_years.to_f)
    end

    ##################################################
    # memoized functions 
    ##################################################
    def carrying_capacity
      ENV['ASSUMED_CARRYING_CAPACITY'].to_i
    end

    def initial_population
      @initial_population ||= Population.last_known
    end

    def previous_population
      @previous_population ||= Population.order(year: :desc).limit(2).last 
    end
  end
end
