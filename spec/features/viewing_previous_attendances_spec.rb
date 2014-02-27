require 'spec_helper'

feature "Viewing previous attendances" do
  let(:seating_chart_page) { SeatingChartPage.new }
  let!(:student_1) { create(:student) }
  let!(:student_2) { create(:student) }
  let!(:attendance_1) { create(:attendance, student: student_1, attended_on: Date.today, seat: 1) }
  let!(:attendance_2) { create(:attendance, student: student_2, attended_on: 1.week.ago, seat: 2) }

  before { sign_in(student_1) }

  scenario do
    seating_chart_page.visit_page
    expect(seating_chart_page).to have_student_in_seat(student: student_1, seat: 1)
    expect(seating_chart_page).to have_absent_student(student_2)
    seating_chart_page.submit_date(1.week.ago)
    expect(seating_chart_page).to have_student_in_seat(student: student_2, seat: 2)
    expect(seating_chart_page).to have_absent_student(student_1)
  end
end

