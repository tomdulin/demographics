require 'rails_helper'

RSpec.describe PopulationsController, type: :controller do
  render_views


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:year_1980) {1980}
    let(:year_1900) {1980}
    it "returns http success" do
      get :show, params: { population: {year: year_1980} }
      expect(response).to have_http_status(:success)
    end

    it "returns a population for a date" do
      get :show, params: { population: {year: year_1900} }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to match /Population: #{PopulationCalculatedLinear.call(year_1900)}/im
    end
     
    it "returns 0 for value not provided" do
      get :show, params: { population: {year: ''} }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to match /Population: 0/im
    end
  end
end
