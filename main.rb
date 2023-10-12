def display_menu
  puts "\nWelcome to School Library App!\n"

  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  display_menu
  loop do
    response = gets.chomp

    case response
    when '1'
      puts '1'
    when '2'
      puts '2'
    when '3'
      puts '3'
    when '4'
      puts '4'
    when '5'
      puts '5'
    when '6'
      puts '6'
    else
      break
    end
  end
end

main
