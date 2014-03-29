class Student < ActiveRecord::Base
  has_many :attendances

  has_secure_password

  def self.in_seat(seat, now=Date.today)
    present(now).where('attendances.seat = ?', seat)
  end

  def self.absent(now=Date.today)
    where.not(id: present(now))
  end

  def self.present(now=Date.today)
    joins(:attendances).where(attendances: {attended_on: now})
  end

  def avatar
    Avatar.from_student(self)
  end
end
