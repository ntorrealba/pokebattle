class AddPokeapiIdToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :pokeapi_id, :integer
  end
end
