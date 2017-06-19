class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :blog_id
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :posts, :blog_id
  end
end
