require 'spec_helper'

feature 'Signing up' do
  describe "signing up" do
    let(:seating_chart_page) { SeatingChartPage.new }
    let(:new_student_page) { NewStudentPage.new }
    let(:navbar_section) { NavbarSection.new }
    let(:new_student) { build(:student) }

    scenario do
      seating_chart_page.visit_page.visit_new_student_page
      new_student_page.create_student(new_student)
      expect(seating_chart_page).to have_student(new_student)
      expect(navbar_section).to be_signed_in
    end
  end
end
