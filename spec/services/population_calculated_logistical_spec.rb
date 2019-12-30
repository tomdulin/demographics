# frozen_string_literal: true

require 'rails_helper'

  RSpec.describe PopulationCalculatedLogistical do
    it 'should accept a year after last known and return the calculated population' do
      expect(PopulationCalculatedLogistical.call(1991)).to eq(252_041_197)
    end

    it 'should accept a year 10 years after last known and return the calculated population' do
      expect(PopulationCalculatedLogistical.call(2000)).to eq(284_104_505)
    end

    it 'should accept a year 50 years after last known and return the calculated population' do
      expect(PopulationCalculatedLogistical.call(2040)).to eq(483_747_238)
    end

    it 'should accept a year 100 years after last known and return the calculated population' do
      expect(PopulationCalculatedLogistical.call(2090)).to eq(750_000_000)
    end
end
