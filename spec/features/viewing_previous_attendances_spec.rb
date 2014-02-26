require 'spec_helper'

feature "Viewing previous attendances" do
  let(:student_index_page) { StudentIndexPage.new }
  let!(:student_1) { create(:student) }
  let!(:student_2) { create(:student) }
  let!(:attendance_1) { create(:attendance, student: student_1, attended_on: Date.today, seat: 1) }
  let!(:attendance_2) { create(:attendance, student: student_2, attended_on: 1.week.ago, seat: 2) }

  before { sign_in(student_1) }

  scenario do
    student_index_page.visit_page
    expect(student_index_page).to have_student_in_seat(student: student_1, seat: 1)
    expect(student_index_page).to have_absent_student(student_2)
    student_index_page.submit_date(1.week.ago)
    expect(student_index_page).to have_student_in_seat(student: student_2, seat: 2)
    expect(student_index_page).to have_absent_student(student_1)
  end
end

