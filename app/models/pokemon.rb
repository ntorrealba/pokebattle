require 'open-uri'
class Pokemon < ApplicationRecord
  require 'open-uri'
  belongs_to :user
  validates :user_id, presence: true
  has_many_attached :images

end
