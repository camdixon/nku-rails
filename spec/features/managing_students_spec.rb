require 'spec_helper'

describe 'managing students' do
  describe "creating a student" do
    let(:student_index_page) { StudentIndexPage.new }
    let(:new_student_page) { NewStudentPage.new }
    let(:new_student) { create(:student) }

    it do
      student_index_page.visit_page.visit_new_student_page
      new_student_page.create_student(new_student)
      expect(student_index_page).to have_student(new_student)
    end
  end

  describe "editing a student" do
    let(:student_index_page) { StudentIndexPage.new }
    let(:edit_student_page) { EditStudentPage.new }
    let!(:student) { create(:student) }

    it do
      student_index_page.visit_page.visit_edit_student_page(student)
      edit_student_page.update_student_name("New Name")
      expect(student.reload.name).to eq("New Name")
    end
  end
end
