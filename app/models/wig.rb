class Wig < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: "User"
  has_many :users, through: :wig_rentals
  has_one_attached :photo

  validates :color, :length, :price, :image_url, :title, presence: true
  validate :greater_than_zero

  private

  def greater_than_zero
    return if price.blank? || length.blank?

    if price <= 0
      errors.add(:price, "Field can't be zero")
    elsif length <= 0
      errors.add(:length, "Field can't be zero")
    end
  end

 

end
