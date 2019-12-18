require 'rails_helper'

RSpec.describe "TheLogs", type: :request do
  describe "GET /the_logz" do
    it "works! (now write some real specs)" do
      get the_logz_index_path
      expect(response).to have_http_status(200)
    end
  end
end
