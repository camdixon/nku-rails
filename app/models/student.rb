class Student < ActiveRecord::Base
  has_secure_password

  def avatar
    Avatar.from_student(self)
  end
end
