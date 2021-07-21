class AddPokemonRefToMovements < ActiveRecord::Migration[6.1]
  def change
    add_reference :movements, :pokemon, null: false, foreign_key: true
  end
end
