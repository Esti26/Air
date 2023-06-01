class AddPriceToWigRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :wig_rentals, :price, :integer
  end
end
