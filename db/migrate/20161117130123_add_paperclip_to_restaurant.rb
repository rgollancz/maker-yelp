class AddPaperclipToRestaurant < ActiveRecord::Migration
  def change
    add_attachment :restaurants, :image
  end
end
