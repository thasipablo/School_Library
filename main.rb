# require './app'

# def main
#   App.new
# end

require_relative './lib/teacher'
require_relative './lib/student'

t = Teacher.new('ML', 43, 'John')
puts "Teacher: #{t.name}, #{t.specialization}"

s = Student.new("Machine Learning", 23, 'Paolo')
puts "Student: #{s.name}, #{s.classroom}"
