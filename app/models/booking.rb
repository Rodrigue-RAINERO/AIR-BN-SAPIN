class Booking < ApplicationRecord
  belongs_to :tree
  belongs_to :user
  validates :tree_id, uniqueness: { scope: :user_id, message: "You have already booked this tree" }

end
