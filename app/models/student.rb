class Student < ActiveRecord::Base
  has_many :attendances

  has_secure_password

  def self.in_seat(seat, now=Time.now)
    present(now).where('attendances.seat = ?', seat)
  end

  def self.absent(now=Time.now)
    all - present(now)
  end

  def self.present(now=Time.now)
    joins(:attendances).where('attendances.created_at >= ?', now.beginning_of_day)
  end

  def avatar
    Avatar.from_student(self)
  end
end
