class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :seat
      t.date :attended_on
      t.references :student
      t.timestamps
    end
  end
end
