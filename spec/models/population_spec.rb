require 'rails_helper'

RSpec.describe Population, type: :model do
  context ':get' do
    
    it 'should accept a year we know and return the correct population' do
      expect(Population.get(1900)).to eq(76_212_168)
      expect(Population.get(1990)).to eq(248_709_873)
    end

    it "should accept a year we don't know that is between two known years and return the calculated population" do
      expect(Population.get(1945)).to eq(141_745_183)
      expect(Population.get(1942)).to eq(135_996_814)
      expect(Population.get(1941)).to eq(134_080_691)
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

  context ':max_year' do
    it 'should return the last known population' do
      expect(Population.max_year).to eq(1990)
    end
  end

  context ':next_known' do
    it 'should return the population for the next known population' do
      expect(Population.next_known(1945).year).to eq(1950)
    end

    it 'should return the population when population is known' do
      expect(Population.next_known(1940).year).to eq(1940)
    end

    it 'should return the population for the earliest known population' do
      expect(Population.next_known(1245).year).to eq(1900)
    end

    it 'should return nil when no known year prior' do
      expect(Population.next_known(4945)).to be_nil
    end
  end

  context ':previous_known' do
    it 'should return the population the next lower known population' do
      expect(Population.previous_known(1945).year).to eq(1940)
    end

    it 'should return the population when year is known ' do
      expect(Population.previous_known(1940).year).to eq(1940)
    end

    it 'should return the latest known population when there is no year after' do
      expect(Population.previous_known(1245)).to be_nil
    end

    it 'should return nil when no known year prior' do
      expect(Population.next_known(4945)).to be_nil
    end
  end
end
