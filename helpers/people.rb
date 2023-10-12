require_relative 'menu'

def create_a_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  response = gets.chomp

  case response
  when '1'
    puts 'student'
  when '2'
    puts 'teacher'
  end

  display_menu
end
