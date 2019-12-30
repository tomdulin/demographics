# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Get population by year', type: :system do
  it 'User is presented with an input form' do
    visit populations_path
    assert_selector "input[name='population[year]']"
    assert_selector 'input[type=submit]'
  end

  describe 'When user enters a valid year' do
    it 'opens results with known year' do
      visit populations_path
      fill_in 'population[year]',	with: '1980'
      click_button 'Submit'
      expect(page).to have_text('You requested the population for: 1980')
      assert_ajax
    end

    it 'calculation options is not present when page is opened' do
      visit populations_path
      expect(page).to have_selector('#exponential', visible: false)
    end

    it 'opens calculations options when valid input is entered' do
      visit populations_path
      fill_in 'population[year]',	with: '1991'
      expect(page).to have_selector('#exponential', visible: true)
    end

    it 'opens results to a results page' do
      visit populations_path
      fill_in 'population[year]',	with: '1991'
      choose('exponential')
      click_button 'Submit'
      expect(page).to have_text('Population: 271,093,761')
      assert_ajax
    end

    it 'shows a population figure' do
      visit populations_path
      fill_in 'population[year]',	with: '1990'

      click_button 'Submit'
      expect(page).to have_text('Population: 248,709,873')
      assert_ajax
    end
  end
  
  describe 'When user enters an invalid year' do
    it 'ignores characters' do
      visit populations_path
      fill_in 'population[year]',	with: '19ww90'
      click_button 'Submit'
      expect(page).to have_text('Population: 248,709,873')
      assert_ajax
    end

    it 'shows 0 population for invalid characters' do
      visit populations_path
      fill_in 'population[year]',	with: 'alskdflk'
      click_button 'Submit'
      expect(page).to have_text('Population: 0')
      assert_ajax
    end

    it 'shows 0 population for no input' do
      visit populations_path
      click_button 'Submit'
      expect(page).to have_text('Population: 0')
      assert_ajax
    end

    it 'does not allow xss' do
      visit populations_path
      fill_in 'population[year]',	with: '><script>alert("XSS")</script>&'
      click_button 'Submit'
      expect(page).not_to have_content('Population:')
      assert_ajax
    end
  end

  private

  def assert_ajax
    assert_selector "input[name='population[year]']"
    assert_selector 'input[type=submit]'
  end
end
