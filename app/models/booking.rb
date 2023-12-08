class Booking < ApplicationRecord
  belongs_to :tree
  belongs_to :user
  # validates :tree_id, uniqueness: { scope: :user_id, message: "You have already booked this tree" }
  validate :check_not_overlapping, on: :create

  def check_not_overlapping
    if tree.bookings.any? { |booking| booking_overlaps?(booking, start_date, end_date) }
      errors.add(:start_date, "Overlaps with existing booking")
    end
  end

    private

    def booking_overlaps?(booking, start_date, end_date)
      booked_dates = (booking.start_date..booking.end_date).to_a
      requested_dates = (start_date..end_date).to_a
      requested_dates.any? do |date|
        booked_dates.include? date
      end
    end
end
