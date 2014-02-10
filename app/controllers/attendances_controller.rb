class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_student.attendances.create(attendance_params)
    redirect_to attendances_path, notice: "You've logged your attendance for today"
  end

  def index
    @attendances = Attendance.all
  end

  private

  def attendance_params
    params.require(:attendance).permit(:seat)
  end
end
