class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :positive, default: true

      t.timestamps null: false
    end

    add_index :likes, :user_id
    add_index :likes, :post_id
    add_index :likes, :positive
  end
end
