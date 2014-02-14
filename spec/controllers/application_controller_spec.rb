require 'spec_helper'

describe ApplicationController do
  let(:student) { create(:student) }

  describe "#current_user" do
    specify "succesfully finds a student" do
      session[:student_id] = student.id
      expect(controller.current_student).to eq(student)
    end

    specify "errors aren't thrown if the student is missing" do
      session[:student_id] = 4321
      expect(controller.current_student).to be_nil
    end
  end
end
