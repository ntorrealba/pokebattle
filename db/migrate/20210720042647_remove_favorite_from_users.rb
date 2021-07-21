class RemoveFavoriteFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :favorite_id, :integer
    remove_column :users, :pokemon_id, :integer
  end
end
