require 'spec_helper'

feature 'Creating attendance' do
  let(:navbar_section) { NavbarSection.new }
  let(:new_attendance_page) { NewAttendancePage.new }
  let(:student) { create(:student) }

  before { sign_in student }

  scenario do
    navbar_section.visit_new_attendance_page
    new_attendance_page.create_attendance(seat: 1)

    attendance = student.attendances.last
    expect(attendance.created_at.to_date).to eq(Date.today)
    expect(attendance.seat).to eq(1)
  end
end

