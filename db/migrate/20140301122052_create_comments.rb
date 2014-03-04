class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.string :commenter
      t.text :comment
      t.timestamps
    end
    add_index :comments, :post_id
  end
end
