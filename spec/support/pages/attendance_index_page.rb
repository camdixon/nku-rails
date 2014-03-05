class AttendanceIndexPage
  include Capybara::DSL
  
  def visit_page
    visit "/attendances"
  end

  def has_attendances?(attendances)
    attendances.all? { |a| has_css?("#attendance_#{a.id}") }
  end
  
  def has_no_attendances?(attendances)
    attendances.all? { |a| has_no_css?("#attendance_#{a.id}") }
  end

  def select_student(student)
    click_link(student.name)
  end 
end
