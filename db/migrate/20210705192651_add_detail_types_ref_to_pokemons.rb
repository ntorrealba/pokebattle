class AddDetailTypesRefToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_reference :pokemons, :detail_type, null: false, foreign_key: true
  end
end
