require_relative 'lib/student'

s = Student.new(9, 'En', 'Vicky')
puts s.name
s.name = 'Gloire'
puts s.name
puts s.classroom
