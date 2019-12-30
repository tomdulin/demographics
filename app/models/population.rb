class Population < ApplicationRecord
  scope :min_year, -> { minimum(:year) }
  scope :max_year, -> { maximum(:year) }
  scope :last_known, -> { order(year: :desc).first }

  has_many :logz, class_name: 'TheLog', foreign_key: 'year', primary_key: 'year'

  # functions to return next and previous known entries given a year
  def self.next_known(year)
    Population.where(year: year..Float::INFINITY).order(:year).first
  end

  def self.previous_known(year)
    Population.where(year: Float::INFINITY..year).order(year: :desc).first
  end
end
