require 'rails_helper'

describe 'Reviews Requests' do
  before(:all) do
    Movie.destroy_all
    Review.destroy_all
    @movies = FactoryGirl.create_list(:movie, 10)
    @reviews = FactoryGirl.create_list(:review, 10)
  end

  describe '#index' do
    it 'gets all reviews for a movie' do
      get "/movies/#{@movies.first.id}/reviews"
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'creates a movie and post and returns' do
      post "/movies/#{@movies.first.id}/reviews",
      { review: {
          author: "Bob McAuthor",
          body: "I am a review body",
          rating: "R"
        }}.to_json,
      {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
      rmovie = JSON.parse(response.body)
    end
  end

#no update or destroy comments
#If you're reading this live be happy and knowing that Weeks is awesome

end
