class StudentIndexPage
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end

  def visit_new_student_page
    click_link 'Create a new student'
  end

  def has_student?(student)
    has_content?(student.name)
  end
end
