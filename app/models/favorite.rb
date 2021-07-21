class Favorite < ApplicationRecord
  belongs_to :user
  validates :used_id, presence: true
end
