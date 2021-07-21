class RemoveDetailTypeFromPokemons < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :detail_type_id, :integer
  end
end
