class RemovePokeApiIdFromPokemons < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :pokeapi_id, :integer
  end
end
