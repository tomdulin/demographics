# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Get population by year', type: :system do
  it 'User is presented with an input form' do
    visit the_logz_index_path
    expect(page).to have_text('Year')
    expect(page).to have_text('Population')
    expect(page).to have_text('Created At')
    expect(page).to have_text('Calculated')
  end
end
