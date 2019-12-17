# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PopulationCalculatedLinear do
  it 'should accept a year we know and return the correct population' do
    expect(PopulationCalculatedLinear.call(1900)).to eq(76_212_168)
    expect(PopulationCalculatedLinear.call(1990)).to eq(248_709_873)
  end

  it "should accept a year we don't know that is between two known years and return the calculated population" do
    expect(PopulationCalculatedLinear.call(1945)).to eq(141_745_183)
    expect(PopulationCalculatedLinear.call(1942)).to eq(135_996_814)
    expect(PopulationCalculatedLinear.call(1941)).to eq(134_080_691)
  end

  it 'should accept a year that is before earliest known and return zero' do
    expect(PopulationCalculatedLinear.call(1800)).to eq(0)
    expect(PopulationCalculatedLinear.call(0)).to eq(0)
    expect(PopulationCalculatedLinear.call(-1000)).to eq(0)
  end

  it 'should accept a year that is after latest known and return the last known population' do
    expect(PopulationCalculatedLinear.call(2000)).to eq(248_709_873)
    expect(PopulationCalculatedLinear.call(200_000)).to eq(248_709_873)
  end

  it 'should accept a year that is after latest known and return the last known population' do
    expect(PopulationCalculatedLinear.call(2000)).to eq(248_709_873)
    expect(PopulationCalculatedLinear.call(200_000)).to eq(248_709_873)
  end
end
