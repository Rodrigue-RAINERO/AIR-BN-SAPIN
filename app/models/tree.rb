class Tree < ApplicationRecord
  belongs_to :user

  # validates :booking, uniqueness: { scope: :user }
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
