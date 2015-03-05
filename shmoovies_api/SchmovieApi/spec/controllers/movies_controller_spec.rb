require 'rails_helper'

RSpec.describe MoviesController do
  let(:valid_attributes) {
    { title: 'movie1',
      release_date: "2009",
      mpaa_rating: "R",
      description: "A Good Movie"
    }
  }

  describe 'GET index' do
    it 'has a 200 satus code' do
      get :index
      expect(response.status).to eq 200
    end
  end

  it 'Renders the index' do
    get :index
    expect(response).to render_template('index')
  end



end
