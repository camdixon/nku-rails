require 'spec_helper'

describe 'Editing profile' do
feature 'Editing profile' do
  let(:student_index_page) { StudentIndexPage.new }
  let(:edit_student_page) { EditStudentPage.new }
  let!(:student) { create(:student) }

  before { signin student }

  scenario do
    student_index_page.visit_page.edit_profile
    edit_student_page.update_student_name("New Name")
    expect(student.reload.name).to eq("New Name")
  end
end
