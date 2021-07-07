class AddMovementRefToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_reference :pokemons, :movement, null: false, foreign_key: true
  end
end
