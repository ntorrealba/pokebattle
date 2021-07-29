class AddNumberToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :number, :integer
  end
end
