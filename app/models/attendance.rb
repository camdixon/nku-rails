class Attendance < ActiveRecord::Base
  belongs_to :student

  validates :attended_on, uniqueness: {scope: :student_id, message: "you already logged your attendance today"}
end
