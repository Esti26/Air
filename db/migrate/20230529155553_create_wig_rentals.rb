class CreateWigRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :wig_rentals do |t|
      t.date :rental_start
      t.date :rental_end
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :wig, null: false, foreign_key: true

      t.timestamps
    end
  end
end
