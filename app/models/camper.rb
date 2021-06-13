class Camper < ApplicationRecord
  validates :name, presence: true
  # validates :age, :inclusion { :in => 8..18 }
  # validates :age, inclusion: { in: [8..18] }
  validates :age, inclusion: { :in => 8..18, :message => "Value should be between 0 and 4" }
  # validates :age, inclusion: { in: 8..18, message: "Value should be between 0 and 4" }
  # in: , :in =>

  has_many :signups
  has_many :activities, through: :signups
end
