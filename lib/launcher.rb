class Launcher
    include Library
    # Print list of Main options
    def option_list
      puts 'Please choose an option by intering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      gets.chomp
    end
  
    # Method that manages main option
    def display_menu(choice, all_books, all_person, all_rentals)
      case choice
      when '1'
        get_list_books(all_books, false)
      when '2'
        get_list_person(all_person, false)
      when '3'
        print 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
        choice = gets.chomp
        add_new_person(all_person, choice)
      when '4'
        add_new_book(all_books)
      when '5'
        create_new_rental(all_rentals, all_books, all_person)
      when '6'
        get_user_rental(all_person)
      else
        wrong_number_msg
      end
    end
  
    # Method that start the App
    def start
      all_books = []
      all_person = []
      all_rentals = []
  
      loop do
        choice = Launcher.new.option_list
        exit if choice == '7'
        display_menu(choice, all_books, all_person, all_rentals)
      end
    end
  end