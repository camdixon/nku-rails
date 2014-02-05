require 'spec_helper'

describe Attendance do
  describe "validating one attendance per student per day" do
    let(:now) { Date.today }
    let(:student) { create(:student) }

    context "when an attendance exists for a student and day" do
      let!(:attendance) { create(:attendance, student: student, created_on: now) }

      specify do
        new_attendance = build(:attendance, student: student, created_on: now)
        new_attendance.save
        expect(new_attendance.errors).to have(1).item
      end
    end

    context "when an attendance exists for a student on a past day" do
      let!(:attendance) { create(:attendance, student: student, created_on: (now - 1.day)) }

      specify do
        new_attendance = build(:attendance, student: student, created_on: now)
        new_attendance.save
        expect(new_attendance.errors).to be_empty
      end
    end
  end
end
