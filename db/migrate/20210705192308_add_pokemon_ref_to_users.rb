class AddPokemonRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :pokemon, null: false, foreign_key: true
  end
end
