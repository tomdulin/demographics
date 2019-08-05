require 'rails_helper'

RSpec.describe "Get population by year", type: :system do
  it "User is presented with an input form" do
    visit populations_path
    assert_selector "input[name=year]"
    assert_selector "button[type=submit]"
  end

  describe "When user enters a valid year" do
    it "redirects to a results page"
    it "shows a population figure"
  end
end
