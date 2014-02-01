class StudentIndexPage
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end

  def visit_new_student_page
    click_link 'Sign up'
  end

  def visit_edit_profile_page
    click_link "Edit your profile"
  end

  def has_student?(student)
    has_content?(student.name)
  end
end
