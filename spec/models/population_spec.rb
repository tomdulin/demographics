# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Population, type: :model do
  context ':get' do
    it 'should accept a year we know and return the correct population' do
      expect(Population.get(1900)).to eq(76_212_168)
      expect(Population.get(1990)).to eq(248_709_873)
    end

    it "should accept a year we don't know and return the previous known population" do
      expect(Population.get(1902)).to eq(76_212_168)
      expect(Population.get(1908)).to eq(76_212_168)
    end

    it 'should accept a year that is before earliest known and return zero' do
      expect(Population.get(1800)).to eq(0)
      expect(Population.get(0)).to eq(0)
      expect(Population.get(-1000)).to eq(0)
    end

    it 'should accept a year that is after latest known and return the last known population' do
      expect(Population.get(2000)).to eq(248_709_873)
      expect(Population.get(200_000)).to eq(248_709_873)
    end
  end

  context ':min_year' do
    it 'should return the earliest known population' do
      expect(Population.min_year).to eq(1900)
    end
  end
end
