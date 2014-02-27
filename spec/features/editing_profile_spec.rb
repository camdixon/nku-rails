require 'spec_helper'

feature 'Editing profile' do
  let(:seating_chart_page) { SeatingChartPage.new }
  let(:edit_student_page) { EditStudentPage.new }
  let!(:student) { create(:student) }

  before { sign_in student }

  scenario do
    seating_chart_page.visit_page.visit_edit_profile_page
    edit_student_page.update_student_name("New Name")
    expect(student.reload.name).to eq("New Name")
  end
end
