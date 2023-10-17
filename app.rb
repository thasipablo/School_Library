require './lib/student'
require './lib/teacher'
require './lib/book'
require './lib/rental'

module Library
  # Display a warning message
  def warn(message)
    puts "\n*** [WARNING] #{message} ***\n\n"
  end

  # Display a success message
  def success(message)
    puts "\n#{message} Created successfully\n\n"
  end

  # Display a list of items
  def list_items(items, item_type)
    puts "\nAll #{item_type}:"
    if items.empty?
      puts 'No record found'
    else
      items.each.with_index do |item, index|
        puts "#{index}) #{item.description}"
      end
    end
    puts "\n"
  end

  # Get user input
  def get_input(prompt)
    print "#{prompt}: "
    gets.chomp
  end

  # Add a new person to the list
  def add_person(list, type)
    age = get_input('Age')
    name = get_input('Name')

    if type == 'Student'
      permission = get_input('Has Parent Permission? [Y/N]').upcase == 'Y'
      person = Student.new(nil, age, name)
      person.parent_permission = permission
    else
      specialization = get_input('Specialization')
      person = Teacher.new(nil, age, name)
      person.specialization = specialization
    end

    list.push(person)
    success('Person')
  end

  # Add a new book to the list
  def add_book(list)
    title = get_input('Title')
    author = get_input('Author')

    book = Book.new(nil, nil)
    book.title = title
    book.author = author

    list.push(book)
    success('Book')
  end

  # Create a rental
  def create_rental(rentals, books, people)
    list_items(books, 'Books')
    book_index = get_input('Select a book by number').to_i

    list_items(people, 'People')
    person_index = get_input('Select a person by number').to_i

    if person_index < people.length && book_index < books.length
      rental_date = get_input('Date')
      rental = Rental.new(rental_date, books[book_index], people[person_index])
      rentals.push(rental)
      success('Rental')
    else
      warn('Invalid book or person number')
    end
  end
end
