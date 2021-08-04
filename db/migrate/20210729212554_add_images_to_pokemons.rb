class AddImagesToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :images, :string, array: true
  end
end
