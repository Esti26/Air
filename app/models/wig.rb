class Wig < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: "User"
  has_many :users, through: :wig_rentals
  has_one_attached :photo

  validates :color, :length, :price, :title, presence: true
  validate :greater_than_zero

  private

  def greater_than_zero
    return if price.blank? || length.blank?

    if price <= 0

      errors.add(:price, "must be greater than zero")
    elsif length <= 0
      errors.add(:length, "must be greater than zero")

    end
  end

end
