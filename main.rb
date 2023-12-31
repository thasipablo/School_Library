require_relative 'lib/launcher'
require_relative 'data/file_manager'

# The entry point method
def main
  puts "\nWelcome to School Library App!\n"

  launcher = Launcher.new
  all_books = launcher.books
  all_person = launcher.person
  all_rentals = launcher.rentals

  loop do
    choice = launcher.option_list
    launcher.use_cases(choice, all_books, all_person, all_rentals)
  end
end

main
