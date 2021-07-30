class Favorite < ApplicationRecord
  require 'open-uri'
  belongs_to :user
  validates :user_id, presence: true
end
