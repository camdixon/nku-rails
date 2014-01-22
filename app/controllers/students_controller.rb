class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.create!(student_params)
    redirect_to students_path
  end

  def index
    @students = Student.all
  end


  private

  def student_params
    params.require(:student).permit!
  end
end
