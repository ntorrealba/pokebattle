class User < ApplicationRecord
  has_many :pokemons
  has_many :favorites
end
