class WigRental < ApplicationRecord
  belongs_to :user
  belongs_to :wig

  validates :rental_start, :rental_end, presence: true
  validate :rental_end_after_rental_start

  private

  def rental_end_after_rental_start
    return if rental_end.blank? || rental_start.blank?

    if rental_end <= rental_start
      errors.add(:rental_end, "must be after the start date")
    end
  end
end
