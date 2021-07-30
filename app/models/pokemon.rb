require 'open-uri'
class Pokemon < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_many_attached :images

end
