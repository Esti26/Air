class CreateWigs < ActiveRecord::Migration[7.0]
  def change
    create_table :wigs do |t|
      t.string :color
      t.integer :length
      t.integer :owner_id

      t.timestamps
    end
    add_foreign_key :wigs, :users, column: :owner_id
  end
end
