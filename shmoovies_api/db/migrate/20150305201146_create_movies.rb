class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :hori_pic
      t.string :vert_pic
      t.string :description
      t.string :release_date
      t.string :tagline
      t.string :popularity
      t.string :runtime
      t.string :budget
      t.string :revenue
      t.string :mpaa
    end
  end
end
