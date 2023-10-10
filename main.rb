require_relative 'lib/student'
require_relative 'lib/teacher'

student = Student.new(9, 'En', 'Vicky')
puts student.name
student.name = 'Gloire'
puts student.name
puts student.can_use_services?
puts "Correct name #{student.correct_name}"

teacher = Teacher.new(34, 'Machine Learning', 'Dry')
puts teacher.name
puts teacher.can_use_services?
