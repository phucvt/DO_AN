class AddLocationToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :location_name, :string
  end
end
