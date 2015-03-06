class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  def database_pull
    @movie.title =
  end
end
