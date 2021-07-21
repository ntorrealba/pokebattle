class AddTypeRefToDetailTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :detail_types, :type, null: false, foreign_key: true
  end
end
