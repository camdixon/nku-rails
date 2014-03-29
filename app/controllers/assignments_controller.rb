require 'csv'  
class AssignmentsController < ApplicationController
  
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = current_student.assignments.build(assignment_params)

    if @assignment.save
    else
      render :new
    end
  end

  def show
    render "index"
  end
  
  def index
    @assignments = Assignment.all
  end
  
  def upload
    csv_text = params[:upload].read
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      #find a student by email and tie to student
      student = Student.find_by_email(params[row["email"]])
      @assignment = Assignment.create!(name:row["name"], total:row["total"], score:row["score"])
    end
    redirect_to
  end

  private

  def attendance_params
    params.require(:assignment).permit()
  end
end