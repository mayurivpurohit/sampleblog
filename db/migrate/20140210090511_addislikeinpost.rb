class Addislikeinpost < ActiveRecord::Migration
  def up
    add_column :posts, :is_like, :integer
  end

  def down
    remove_column :posts, :is_like
  end
end
