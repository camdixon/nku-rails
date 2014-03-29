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
    @assignments = Assignment.all
    csv_text = params[:upload].read
    csv = CSV.parse(csv_text, :headers => true)
    count = 0
    csv.each do |row|
      found_existing = false
      #find a student by email and tie to student
      #skip line if it has any blank values
      next if row["email"] == nil || row["score"] == nil || row["name"] == nil || row["total"] == nil
      student_email = Student.find_by_email(row["email"])
      #if we do not have the above student in our database, skip over him
      next if student_email == nil
      
      debugger
      #update score if student's email and assignment name already exist
      @assignments.each do |assignment|
        if assignment.name == row["name"] && student_email.email == row["email"]
          found_existing = true
          assignment.score =  row["score"]
          assignment.total =  row["total"]   
        end
      end
      next if found_existing == true
      
      #otherwise, add in the new assignment below
      @assignment = Assignment.create!(name:row["name"], student_id:student_email.id, total:row["total"], score:row["score"])
      count += 1
    end
    redirect_to assignments_path, notice: "#{count} assignments were created"
  end

  private

  def attendance_params
    params.require(:assignment).permit()
  end
end