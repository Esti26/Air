class Wig < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: "User"
  has_many :users, through: :wig_rentals
  has_one_attached :photo
end
