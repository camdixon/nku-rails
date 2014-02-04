class NewAttendancePage
  include Capybara::DSL

  def create_attendance(options={})
    fill_in 'attendance_seat', with: options.fetch(:seat, 1)
    click_button 'Create'
  end
end
