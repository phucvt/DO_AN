class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :area
      t.string :address
      t.string :desc
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
  end
end
