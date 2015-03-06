# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150305203704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "hori_pic"
    t.string "vert_pic"
    t.string "description"
    t.string "release_date"
    t.string "tagline"
    t.string "popularity"
    t.string "runtime"
    t.string "budget"
    t.string "revenue"
    t.string "mpaa"
  end

  create_table "reviews", force: :cascade do |t|
    t.string  "author"
    t.string  "body"
    t.string  "rating"
    t.integer "movie_id"
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree

  add_foreign_key "reviews", "movies"
end
