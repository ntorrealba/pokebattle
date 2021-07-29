class User < ApplicationRecord
  has_many :pokemons
  has_many :favorites
  validates :email, uniqueness: true


   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:validatable
         #:recoverable, :rememberable
end
