class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.create!(student_params)
    session[:student_id] = @student.id
    redirect_to students_path, notice: "Hi #{@student.name}. Thanks for signing up!"
  end

  def edit
    @student = current_student
  end

  def update
    current_student.update_attributes!(student_params)
    redirect_to students_path, notice: "Successfully updated profile"
  end

  def index
    @students = Student.all
  end

  private

  def student_params
    params.require(:student).permit!
  end
end
