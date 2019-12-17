require 'rails_helper'

RSpec.describe Population, type: :model do

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

  context ':last_known' do
    it 'should return the last known population''s year' do
      expect(Population.last_known.year).to eq(1990)
    end
    it 'should return the last known population''s population' do
      expect(Population.last_known.population).to eq(248_709_873)
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
