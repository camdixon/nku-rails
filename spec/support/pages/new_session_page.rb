class NewSessionPage
  include Capybara::DSL

  def visit_page
    visit('/sessions/new')
  end

  def signin(student)
    fill_in 'Email', with: student.email
    fill_in 'Password', with: student.password || "password"
    click_button 'Sign in'
  end

  def successful?
    has_content?("Signed in!")
  end
end
