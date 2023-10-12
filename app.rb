require './helpers/menu'
require './helpers/people'

class App
  puts "\nWelcome to School Library App!"

  display_menu

  loop do
    response = gets.chomp

    case response
    when '1'
      puts '1 - List all books'
    when '2'
      puts '2 - List all people'
    when '3'
      create_a_person
    when '4'
      puts '4 - Create a book'
    when '5'
      puts '5 - Create a rental'
    when '6'
      puts '6 - List all rentals for a given person id'
    when '7'
      break
    end
  end
end
