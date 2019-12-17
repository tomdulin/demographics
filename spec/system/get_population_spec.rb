require 'rails_helper'

RSpec.describe 'Get population by year', type: :system do
  it 'User is presented with an input form' do
    visit populations_path
    assert_selector 'input[name=year]'
    assert_selector 'button[type=submit]'
  end

  describe 'When user enters a valid year' do
    it 'redirects to a results page' do
      visit populations_path
      fill_in 'year',	with: '1991'
      click_button 'Submit'
      expect(page).to have_text('You requested the population for: 1991')
    end
    it 'shows a population figure' do
      visit populations_path
      fill_in 'year',	with: '1991'
      click_button 'Submit'
      expect(page).to have_text('Population: 248709873')
    end
  end
end
