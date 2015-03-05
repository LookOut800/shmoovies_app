class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
end
