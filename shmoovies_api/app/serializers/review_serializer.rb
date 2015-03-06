class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :author, :body, :rating
end
