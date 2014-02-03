class Student < ActiveRecord::Base
  def avatar
    Avatar.from_student(self)
  end
end
