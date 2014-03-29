class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :total
      t.integer :score
      t.references :student
      t.string :name
    end
  end
end
