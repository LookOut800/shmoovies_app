class MovieSerializer < ActiveModel::Serializer
  attributes :id, :tmbd_id
  has_many :reviews
end
