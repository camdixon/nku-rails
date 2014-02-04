require 'spec_helper'

feature 'Editing profile' do
  let(:student_index_page) { StudentIndexPage.new }
  let(:edit_student_page) { EditStudentPage.new }
  let!(:student) { create(:student) }

  before { sign_in student }

  scenario do
    student_index_page.visit_page.visit_edit_profile_page
    edit_student_page.update_student_name("New Name")
    expect(student.reload.name).to eq("New Name")
  end
end
