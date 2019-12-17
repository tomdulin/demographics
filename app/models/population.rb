# frozen_string_literal: true

class Population < ApplicationRecord
  scope :min_year, -> { minimum(:year) }
  scope :max_year, -> { maximum(:year) }


  def self.next_known(year)
    Population.where(year: year..Float::INFINITY).order(:year).first
  end

  def self.previous_known(year)
    Population.where(year: Float::INFINITY..year).order(year: :desc).first
  end
end
