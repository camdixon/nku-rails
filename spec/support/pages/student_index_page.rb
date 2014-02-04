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

  def has_student_in_seat?(options={})
    student = options[:student]
    seat = options[:seat]

    find("#seat-#{seat}").has_content?(student.name)
  end

  def has_absent_student?(student)
    find("#absent-students").has_content?(student.name)
  end
end
