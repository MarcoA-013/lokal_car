class AddUrlImageToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :url_image, :string
  end
end
