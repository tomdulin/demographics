class Population < ApplicationRecord
  scope :min_year, -> { minimum(:year) }

  # return 0 if year is before earliest known year
  # return latest if year is after all known years
  # return previous year if year is not known
  def self.get(year)
    year = year.to_i
    year < Population.min_year ? 0 : Population.where(year: Float::INFINITY..year).order(year: :desc).pluck(:population).first
  end
end
