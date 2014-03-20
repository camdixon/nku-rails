class RemoveBlog < ActiveRecord::Migration
  def change
    drop_table :posts
    drop_table :comments
  end
end
