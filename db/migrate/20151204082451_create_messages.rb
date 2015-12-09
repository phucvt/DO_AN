class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.string :title
      t.text :content
      t.boolean :status, default: false
      
      t.timestamps null: false
    end
  end
end
