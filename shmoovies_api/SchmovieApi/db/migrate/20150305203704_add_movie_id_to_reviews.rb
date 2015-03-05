class AddMovieIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :movie, index: true
    add_foreign_key :reviews, :movies
  end
end
