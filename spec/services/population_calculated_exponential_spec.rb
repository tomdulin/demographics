# frozen_string_literal: true

require 'rails_helper'

  RSpec.describe PopulationCalculatedLinear do
    it 'should accept a year after last known and return the calculated population' do
      expect(PopulationCalculatedExponential.call(1991)).to eq(271_093_761) #272_131_947
      expect(PopulationCalculatedExponential.call(1992)).to eq(295_492_200)
    end

    it 'should accept a largeyear after last known and return the calculated population' do
      expect(PopulationCalculatedExponential.call(2500)).to eq(3042334591789847255877419008)
    end
end
