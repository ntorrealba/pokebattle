class AddDetailsToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :number, :integer
    add_column :pokemons, :types, :string, array: true
    add_column :pokemons, :height, :integer
    add_column :pokemons, :weight, :integer
    add_column :pokemons, :abilities, :string, array: true
    add_column :pokemons, :moves, :string, array: true
    add_column :pokemons, :base_states, :string, array: true
  end
end
