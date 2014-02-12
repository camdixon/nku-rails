class NewSessionPage
  include Capybara::DSL

  def visit_page
    visit('/sessions/new')
    self
  end

  def sign_in(student, password="password")
    fill_in 'Email', with: student.email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end

  def successful?
    has_content?("Signed in!")
  end
end
