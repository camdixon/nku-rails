class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_student.attendances.build(attendance_params)
    @attendance.attended_on = Date.today

    if @attendance.save
      redirect_to root_path, notice: "You've logged your attendance for today"
    else
      render :new
    end
  end

  def index
    @attendances = Attendance.all
  end

  private

  def attendance_params
    params.require(:attendance).permit(:seat)
  end
end
