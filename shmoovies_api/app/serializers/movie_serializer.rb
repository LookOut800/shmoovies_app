class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_date, :mpaa_rating, :description
  has_many :reviews
end
