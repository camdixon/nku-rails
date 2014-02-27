class StudentIndexPage
  include Capybara::DSL

  def visit_page
    visit '/students/'
    self
  end

  def has_students?(students)
    students.all? { |s| has_content?(s.name) }
  end
end

