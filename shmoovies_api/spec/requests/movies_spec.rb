require 'rails_helper'

describe 'Movie Requests' do
  before(:all) do
    Movie.destroy_all
    @movies = FactoryGirl.create_list(:movie, 10)
  end
  describe '#index' do
    it 'gets all of the movies' do
      get '/movies'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 10
    end
  end

  describe '#create' do
    it 'creates movies' do
      post "/movies",
      { movie: {
          title: "Movie Title",
          release_date: "10-10-88",
          mpaa_rating: "NR",
          description: "It was a decent movie, not as good as that one with JLaw though."
        }}.to_json,
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
        expect(response).to be_success
        expect(response.content_type).to be Mime::JSON
        movie = JSON.parse(response.body)
    end
  end





end
