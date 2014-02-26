require 'spec_helper'

feature "Viewing student attendances" do
  let(:attendance_index_page) { AttendanceIndexPage.new }
  let!(:student) { create(:student) }
  let!(:other_student) { create(:student) }
  let!(:attendance) { create(:attendance, student: student) }
  let!(:other_attendance) { create(:attendance, student: other_student) }

  before { sign_in(student) }

  scenario do
    attendance_index_page.visit_page
    attendance_index_page.select_student(student)
    expect(attendance_index_page).to have_attendances(student.attendances)
    expect(attendance_index_page).to have_no_attendances(other_student.attendances)
  end
end
