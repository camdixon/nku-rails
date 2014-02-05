class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :seat
      t.date :created_on
      t.references :student
      t.timestamps
    end
  end
end
