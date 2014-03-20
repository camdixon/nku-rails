require 'spec_helper'

feature 'Viewing the seating chart' do
  let(:students) { create_list(:student, 2) }
  let(:student_index_page) { StudentIndexPage.new }

  before { sign_in students.first }

  scenario do
    student_index_page.visit_page
    expect(student_index_page).to have_students(students)
  end
end

