class Tree < ApplicationRecord
  belongs_to :user

  # validates :booking, uniqueness: { scope: :user }
  has_many :bookings, dependent: :destroy

end
