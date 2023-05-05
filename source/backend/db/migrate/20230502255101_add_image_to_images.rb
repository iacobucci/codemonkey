class AddImageToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :image, :string
  end
end
