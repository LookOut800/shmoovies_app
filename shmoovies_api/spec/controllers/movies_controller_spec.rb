# require 'rails_helper'

# RSpec.describe MoviesController do
#   let(:valid_attributes) {
#     { title: 'movie1',
#       release_date: "2009",
#       mpaa_rating: "R",
#       description: "A Good Movie"
#     }
#   }

#   describe 'GET index' do
#     it 'has a 200 satus code' do
#       get :index
#       expect(response.status).to eq 200
#     end

#   it 'Renders the index' do
#     get :index
#     expect(response).to render_template('index')
#   end

#   it 'assigns @movies correctly' do
#     movies = Movie.all
#       get :index
#       expect(assigns(:movies)).to eq movies
#     end
#   end

#   describe 'GET show' do
#     it 'has a 200 status code' do
#       movie = Movie.create!(valid_attributes)
#       get :show, id: movie
#       expect(response.status).to eq 200
#     end

#     it 'assigns @movie' do
#       movie = Movie.create!(valid_attributes)
#       get :show, id: movie
#       expect(assigns(:movie)). to eq movie

#     end


#   end
# end
