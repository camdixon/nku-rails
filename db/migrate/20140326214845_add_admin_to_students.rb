class AddAdminToStudents < ActiveRecord::Migration
  def change
    add_column :students, :admin, :boolean
  end
end
