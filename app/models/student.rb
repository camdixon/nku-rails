class Student < ActiveRecord::Base
  has_many :attendances

  has_secure_password

  def avatar
    Avatar.from_student(self)
  end
end
