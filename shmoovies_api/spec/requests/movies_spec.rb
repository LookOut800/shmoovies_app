require 'rails_helper'

describe 'Movies Requests' do
  before(:all) do
    Movie.destroy_all
    Review.destroy_all
    @movies = FactoryGirl.create_list(:post, 10)
    @reviews = FactoryGirl.create_list(:comment, 15)
  end

  describe'#index' do
    it 'gets all the reviews for any movie' do
      get "/movies/#{movies.first.id}/reviews"
      expect(response).to be_success
    end
  end








end
