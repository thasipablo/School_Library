require './lib/student'
require './lib/teacher'
require './lib/book'
require './lib/rental'

module Library
  # Warnig method that displays a wrong message passed
  def wrong_number_msg
    puts "\n*** [WARNING] You passed a wrong number ***"
    puts "\n"
  end

  # method that checks whether option number is valid or not
  def valid_number?(range, choice)
    unless range.include?(choice)
      wrong_number_msg
      return false
    end
    true
  end

  # Method that displays customized success message
  def success_msg(label)
    puts "\n#{label} Created successfully"
    puts "\n"
  end

  # Method that displays all recorded books
  def get_list_books(list_book, show_index)
    puts "\nAll Books:"
    if list_book.length.positive?
      list_book.each.with_index do |book, index|
        book_index = show_index ? "#{index})" : ''
        puts "#{book_index} Title: #{book.title},  Author: #{book.author}"
      end
    else
      puts 'No record found'
    end
    puts "\n"
  end

  # Method that displays all recorded person
  def get_list_person(list_person, show_index)
    puts "\nAll People:"
    if list_person.length.positive?
      list_person.each.with_index do |people, index|
        person_index = show_index ? "#{index})" : ''
        puts "#{person_index} #{people.description}"
      end
    else
      puts 'No record found'
    end
    puts "\n"
  end

  # Method that displays all user rental
  def get_user_rental(list_person)
    puts 'All rentals for a given person id'
    id = gets.chomp
    list_person.each do |person|
      person.rentals_description if person.id == id.to_i
    end
    puts "\n"
  end

  # Method that helps to add new person to the array
  def add_new_person(list_person, choice)
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
    return unless valid_number?(%w[1 2], choice)

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case choice
    when '1'
      student = Student.new(nil, age, name)
      print 'Has Parent Permission? [Y/N]: '
      par_permission = gets.chomp
      student.parent_permission = (par_permission.upcase == 'Y')
      list_person.push(student)
    when '2'
      teacher = Teacher.new(nil, age, name)
      print 'Specialization: '
      teacher.specialization = gets.chomp
      list_person.push(teacher)
    end
    success_msg('Person')
  end

  # Method that helps to add new book to the array
  # list_book: array of books
  def add_new_book(list_book)
    book = Book.new(nil, nil)
    print 'title: '
    book.title = gets.chomp
    print 'Author: '
    book.author = gets.chomp
    list_book.push(book)
    success_msg('Book')
  end

  # Method that helps to add new rental to the array
  def create_new_rental(list_rental, list_book, list_person)
    puts 'Select a book from the following list by number'
    get_list_books(list_book, true)
    book_index = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    get_list_person(list_person, true)
    person_index = gets.chomp

    if !list_person[person_index.to_i].nil? && !list_book[book_index.to_i].nil?
      rental = Rental.new(list_person[person_index.to_i], list_book[book_index.to_i], nil)
      print 'Date: '
      rental_date = gets.chomp
      rental.date = rental_date
      success_msg('Rental')
      list_rental.push(rental)
    else
      wrong_number_msg
    end
  end
end