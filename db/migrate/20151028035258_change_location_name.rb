class ChangeLocationName < ActiveRecord::Migration
  def change
    rename_column :posts, :location_name, :location_id
  end
end
