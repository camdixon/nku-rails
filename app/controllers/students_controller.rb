class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.create!(student_params)
    redirect_to students_path
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attributes!(student_params)
    redirect_to students_path
  end

  def index
    @students = Student.all.map { |s| StudentPresenter.new(s) }
  end


  private

  def student_params
    params.require(:student).permit!
  end
end
