class RemoveFavoriteFromPokemons < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :favorite_id, :integer
    remove_column :pokemons, :movement_id, :integer
  end
end
