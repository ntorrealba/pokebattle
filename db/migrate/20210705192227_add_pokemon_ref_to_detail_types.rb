class AddPokemonRefToDetailTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :detail_types, :pokemon, null: false, foreign_key: true
  end
end
