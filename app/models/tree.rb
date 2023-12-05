class Tree < ApplicationRecord
  belongs_to :user
  # validates :booking, uniqueness: { scope: :user }
end
