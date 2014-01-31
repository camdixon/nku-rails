class NewStudentPage
  include Capybara::DSL

  def create_student(student)
    fill_in 'Name', with: student.name
    fill_in 'Nickname', with: student.nickname
    fill_in 'Email', with: student.email
    fill_in 'Image URL', with: student.image_url
    fill_in 'Password', with: student.password
    fill_in 'Password Confirmation', with: student.password
    click_button 'Sign up'
  end
end
