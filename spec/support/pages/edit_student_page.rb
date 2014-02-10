class EditStudentPage
  include Capybara::DSL

  def update_student_name(name)
    fill_in 'Name', with: name
    click_button 'Update profile'
  end
end

