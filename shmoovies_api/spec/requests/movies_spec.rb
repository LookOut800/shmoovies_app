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
          tmbd_id: 2
        }}.to_json,
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
        expect(response).to be_success
        expect(response.content_type).to be Mime::JSON
        movie = JSON.parse(response.body)
    end
  end

  describe '#show' do
    it 'get a post by ID and return JSON data' do
      @movie = @movies.first
      get "/movies/#{@movie.id}"
      expect(response).to be_success
      movie = JSON.parse(response.body)
      expect(movie['tmbd_id']).to eq @movie.tmbd_id
    end
  end




end
