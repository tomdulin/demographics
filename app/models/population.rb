# frozen_string_literal: true

class Population < ApplicationRecord
  scope :min_year, -> { minimum(:year) }
  scope :max_year, -> { maximum(:year) }

  # return 0 if year is before earliest known year
  # return latest if year is after all known years
  # return previous year if year is not known
  def self.get(year)
    year = year.to_i

    return 0 if year < Population.min_year                             # no previous year

    previous_year = Population.previous_known(year)

    return previous_year.population if previous_year.year == year      # year entered is known

    next_year = Population.next_known(year)

    return previous_year.population if next_year.nil?                  # there is no next year - context of years are in boundaries

    # calculate the percentage that year is between next and previous years
    mod_percentage =  (year - previous_year.year).to_f / (next_year.year - previous_year.year).to_f
    delta_population = next_year.population - previous_year.population

    (delta_population * mod_percentage).to_i + previous_year.population
  end

  def self.next_known(year)
    Population.where(year: year..Float::INFINITY).order(:year).first
  end

  def self.previous_known(year)
    Population.where(year: Float::INFINITY..year).order(year: :desc).first
  end
end
