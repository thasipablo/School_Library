require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown')
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
