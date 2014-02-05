class Attendance < ActiveRecord::Base
  belongs_to :student

  validate :one_attendance_per_student_per_day

  before_create :set_created_on

  def one_attendance_per_student_per_day
    if self.class.where(student_id: student_id, created_on: created_on).present?
      errors.add(:base, "you already logged your attendance today")
    end
  end

  private

  def set_created_on
    self.created_on ||= Date.today
  end
end
