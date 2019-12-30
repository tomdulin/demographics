class AggregateKnownYears
  class << self
    include Service

    # get a count of associated logs by year, order by count desc
    def call
      Population.left_joins(:logz).group(:year).count('the_logz.year').sort_by { |_k, v| v }.reverse
    end
  end
end
