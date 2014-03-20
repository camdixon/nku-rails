require 'spec_helper'

feature 'Viewing the seating chart' do
  let(:student) { create(:student) }
  let(:student_seating_chart) { SeatingChartPage.new }

  let!(:student_in_seat_1) do
    attendance = create(:attendance, seat: 1, attended_on: Date.today)
    create(:student, attendances: [attendance])
  end

  let!(:student_in_seat_2) do
    attendance = create(:attendance, seat: 2, attended_on: Date.today)
    create(:student, attendances: [attendance])
  end

  let!(:absent_student) { create(:student, attendances: []) }

  before { sign_in student }

  scenario do
    expect(student_seating_chart).to have_student_in_seat(student: student_in_seat_1, seat: 1)
    expect(student_seating_chart).to have_student_in_seat(student: student_in_seat_2, seat: 2)
    expect(student_seating_chart).to have_absent_student(absent_student)
  end
end

