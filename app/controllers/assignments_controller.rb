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
    count = 0
    csv.each do |row|
      #find a student by email and tie to student
      #skip line if it has any blank values
      next if row["email"] == nil || row["score"] == nil || row["name"] == nil || row["total"] == nil
      #update score if student's email and assignment name already exist
      #here
      #otherwise, add in the new assignment below
      student = Student.find_by_email(params[row["email"]])
      @assignment = Assignment.create!(name:row["name"], total:row["total"], score:row["score"])
      count += 1
    end
    redirect_to assignments_path, notice: "#{count} assignments were created"
  end

  private

  def attendance_params
    params.require(:assignment).permit()
  end
end