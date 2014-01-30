require 'spec_helper'

feature 'Signing up' do
  describe "signing up" do
    let(:student_index_page) { StudentIndexPage.new }
    let(:new_student_page) { NewStudentPage.new }
    let(:navbar_section) { NavbarSection.new }
    let(:new_student) { build(:student) }

    scenario do
      student_index_page.visit_page.visit_new_student_page
      new_student_page.create_student(new_student)
      expect(student_index_page).to have_student(new_student)
      expect(navbar_section).to be_signed_in
    end
  end
end