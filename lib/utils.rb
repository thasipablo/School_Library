require_relative 'student'
require_relative 'teacher'

# Method that creates a new student
def create_student(name, age)
  student = Student.new(nil, age, name)
  print 'Has Parent Permission? [Y/N]: '
  par_permission = gets.chomp
  student.parent_permission = (par_permission.upcase == 'Y')
  student
end

# Method that creates a new teacher
def create_teacher(name, age)
  teacher = Teacher.new(nil, age, name)
  print 'Specialization: '
  teacher.specialization = gets.chomp
  teacher
end
