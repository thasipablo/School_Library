require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

module Library
  # Warnig method that displays a wrong message passed
  def wrong_number_msg
    puts "\n[WARNING] You passed a wrong number\n"
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
    puts "\n#{label} Created successfully\n"
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
  def get_user_rental(list_person, all_rentals)
    puts 'All rentals for a given person id'
    id = gets.chomp
    list_person.each do |person|
      person.rentals = person.filter_user_rentals(all_rentals, id.to_i)
      person.rentals_description if person.id == id.to_i
    end
  end

  # Method that helps to add new person
  def add_new_person(list_person, choice)
    return unless valid_number?(%w[1 2], choice)

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case choice
    when '1' then create_student(age, name, list_person)
    when '2' then create_teacher(age, name, list_person)
    end
    success_msg('Person')
  end

  def create_student(age, name, list_person)
    student = Student.new(nil, age, name)
    print 'Has Parent Permission? [Y/N]: '
    par_permission = gets.chomp
    student.parent_permission = (par_permission.upcase == 'Y')
    list_person.push(student)
  end

  def create_teacher(age, name, list_person)
    teacher = Teacher.new(nil, age, name)
    print 'Specialization: '
    teacher.specialization = gets.chomp
    list_person.push(teacher)
  end

  # Method that helps to add new book
  def add_new_book(list_book)
    book = Book.new(nil, nil)
    print 'title: '
    book.title = gets.chomp
    print 'Author: '
    book.author = gets.chomp
    list_book.push(book)
    success_msg('Book')
  end

  # Method that helps to add new rental
  def create_new_rental(list_rental, list_book, list_person)
    puts 'Select a book from the following list by number:'
    get_list_books(list_book, true)
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id):'
    get_list_person(list_person, true)
    person_index = gets.chomp.to_i

    if person_index < list_person.length && book_index < list_book.length
      print 'Date: '
      rental_date = gets.chomp
      rental = Rental.new(rental_date, list_book[book_index], list_person[person_index])
      list_rental.push(rental)
      success_msg('Rental')
    else
      wrong_number_msg
    end
  end
end
