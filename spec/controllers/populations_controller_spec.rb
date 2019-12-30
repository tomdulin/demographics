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

    it "returns http success" do
      get :show, params: { population: {year: 1980} }, xhr: true
      expect(response).to have_http_status(:success)
    end

    it "returns a 0 population for a year of 1800" do
      get :show, params: { population: {year: 1800} }, xhr: true
      expect(response.body).to match /Population: 0/im
    end

    it "returns a 0 population for a year of 0" do
      get :show, params: { population: {year: 0} }, xhr: true
      expect(response.body).to match /Population: 0/im
    end

    it "returns a 0 population for a year of -1000" do
      get :show, params: { population: {year: -1000} }, xhr: true
      expect(response.body).to match /Population: 0/im
    end

    it "returns a population for a date" do
      get :show, params: { population: {year: 1900} }, xhr: true
      expect(response.content_type).to eq "text/javascript"
      expect(response.body).to match /Population: 76,212,168/im
    end
     
    it "returns 0 for value not provided" do
      get :show, params: { population: {year: ''} }, xhr: true
      expect(response.content_type).to eq "text/javascript"
      expect(response.body).to match /Population: 0/im
    end

    it "returns valid population for year after last known" do
      get :show, params: { population: {year: '2000'} }, xhr: true
      expect(response.content_type).to eq "text/javascript"
      expect(response.body).to match /Population: 284,104,505/im
    end

    it "returns valid population for year after last known" do
      get :show, params: { population: {year: '2000'}, calculation:'exponential' }, xhr: true
      expect(response.content_type).to eq "text/javascript"
      expect(response.body).to match /Population: 588,786,718/im
    end

    it "returns valid population for year after last known and max allowed" do
      get :show, params: { population: {year: '3000'} }, xhr: true
      expect(response.content_type).to eq "text/javascript"
      expect(response.body).to match /Population: 750,000,000/im
    end


    it "returns valid population for year after last known and max allowed" do
      get :show, params: { population: {year: '3000'}, calculation: 'exponential' }, xhr: true
      expect(response.content_type).to eq "text/javascript"
      expect(response.body).to match /Population: 3,042,334,591,789,847,255,877,419,008/im
    end
  end
end
