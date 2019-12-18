# frozen_string_literal: true

require 'rails_helper'

  RSpec.describe AggregateKnownYears do
    it 'return sorted array of known years to their counts' do
      expect(AggregateKnownYears.call.count).to eq(Population.count)
    end

    it 'returns array containing each known year' do
      years = AggregateKnownYears.call.map{|k,v| k}
      Population.pluck(:year).each do |year|
        years.include?(year)
      end
    end
end
