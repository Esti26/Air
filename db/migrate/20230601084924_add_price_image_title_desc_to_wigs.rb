class AddPriceImageTitleDescToWigs < ActiveRecord::Migration[7.0]
  def change
    add_column :wigs, :price, :integer
    add_column :wigs, :image_url, :string
    add_column :wigs, :title, :string
    add_column :wigs, :description, :string
  end
end
