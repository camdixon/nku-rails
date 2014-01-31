class StudentIndexPage
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end

  def visit_new_student_page
    click_link 'Sign up'
  end

  def visit_edit_student_page(student)
    within "#student_#{student.id}" do
      click_link student.name
    end
  end

  def has_student?(student)
    has_content?(student.name)
  end
end
