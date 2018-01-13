# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search_name)
    @found_students = []
    Student.all.each do |student|
      if student.name.downcase.include?(search_name.downcase)
        @found_students << student
      end
    end
    @found_students
  end

end
