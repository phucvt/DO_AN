class AddApproveToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :approve, :boolean, default: false
  end
end
