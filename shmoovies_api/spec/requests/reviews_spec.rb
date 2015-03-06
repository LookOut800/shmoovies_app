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

end
