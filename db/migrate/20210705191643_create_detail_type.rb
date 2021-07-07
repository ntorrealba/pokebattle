class CreateDetailType < ActiveRecord::Migration[6.1]
  def change
    create_table :detail_types do |t|

      t.timestamps
    end
  end
end
