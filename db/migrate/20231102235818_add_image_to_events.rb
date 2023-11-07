class AddImageToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :image, :text
  end
end
