class AddAdminToStudents < ActiveRecord::Migration
  def change
    add_column :students, :admin, :string
  end
end
