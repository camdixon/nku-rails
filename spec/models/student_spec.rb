require 'spec_helper'

describe Student do
  let(:now) { Time.parse('2014-01-01') }

  describe ".in_seat" do

    let!(:student_in_seat_1) do
      attendance = create(:attendance, created_at: now, seat: 1)
      create(:student, attendances: [attendance])
    end

    let!(:student_in_seat_2) do
      attendance = create(:attendance, created_at: now, seat: 2)
      create(:student, attendances: [attendance])
    end

    let!(:absent_student) do
      attendance = create(:attendance, created_at: now - 1.day, seat: 1)
      create(:student, attendances: [attendance])
    end

    specify do
      students = Student.in_seat(1, now)
      expect(students).to include(student_in_seat_1)
      expect(students).to_not include(student_in_seat_2)
      expect(students).to_not include(absent_student)
    end
  end

  describe ".absent" do
    let!(:present_student) do
      attendance = create(:attendance, created_at: now, seat: 1)
      create(:student, attendances: [attendance])
    end

    let!(:absent_student) do
      attendance = create(:attendance, created_at: now - 1.day, seat: 1)
      create(:student, attendances: [attendance])
    end

    specify do
      students = Student.absent(now)
      expect(students).to include(absent_student)
      expect(students).to_not include(present_student)
    end
  end
end
