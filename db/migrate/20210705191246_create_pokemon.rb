class CreatePokemon < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :wight
      t.string :hability
      t.integer :level

      t.timestamps
    end
  end
end
