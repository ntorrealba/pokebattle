class AddDetailTypeRefToTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :types, :detail_type, null: false, foreign_key: true
  end
end
