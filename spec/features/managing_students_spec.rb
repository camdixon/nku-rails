require 'spec_helper'

describe 'managing students' do
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
