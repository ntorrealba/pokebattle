class CreateMovement < ActiveRecord::Migration[6.1]
  def change
    create_table :movements do |t|
      t.string :attack
      t.integer :level

      t.timestamps
    end
  end
end
