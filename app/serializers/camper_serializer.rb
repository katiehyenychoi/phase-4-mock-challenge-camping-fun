class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  has_many :activities #It nests activities for Each Camper in def show.
end
