require './lib/student'
require './lib/teacher'
require './lib/book'
require './lib/rental'
require './lib/utils'
require 'json'

# Define a module for saving and loading data
module DataStorage
  def self.save_data(file_name, data)
    File.write(file_name, data.to_json)
  end

  def self.load_data(file_name, default_data)
    return default_data unless File.exist?(file_name)

    JSON.parse(File.read(file_name))
  end
end

# Define a module for user interface-related methods
module UserInterface
  def self.wrong_number_msg
    puts "\n*** [WARNING] You passed a wrong number ***"
    puts "\n"
  end

  def self.valid_number?(range, choice)
    unless range.include?(choice)
      wrong_number_msg
      return false
    end
    true
  end

  def self.success_msg(label)
    puts "\n#{label} Created successfully"
    puts "\n"
  end

  def self.get_list_books(list_book, show_index)
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

  def self.get_list_person(list_person, show_index)
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

  def self.get_user_rental(list_person)
    puts 'All rentals for a given person id'
    id = gets.chomp
    list_person.each do |person|
      person.rentals_description if person.id == id.to_i
    end
    puts "\n"
  end
end

# Define a module for library operations
module Library
  def self.add_new_person(list_person, choice)
    return unless UserInterface.valid_number?(%w[1 2], choice)

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case choice
    when '1'
      student = create_student(name, age)
      list_person.push(student)
    when '2'
      teacher = create_teacher(name, age)
      list_person.push(teacher)
    end
    UserInterface.success_msg('Person')
  end

  def self.add_new_book(list_book)
    book = Book.new(nil, nil)
    print 'Title: '
    book.title = gets.chomp
    print 'Author: '
    book.author = gets.chomp
    list_book.push(book)
    UserInterface.success_msg('Book')
  end

  def self.create_new_rental(list_rental, list_book, list_person)
    puts 'Select a book from the following list by number:'
    UserInterface.get_list_books(list_book, true)
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id):'
    UserInterface.get_list_person(list_person, true)
    person_index = gets.chomp.to_i

    if person_index < list_person.length && book_index < list_book.length
      print 'Date: '
      rental_date = gets.chomp
      rental = Rental.new(rental_date, list_book[book_index], list_person[person_index])
      list_rental.push(rental)
      UserInterface.success_msg('Rental')
    else
      UserInterface.wrong_number_msg
    end
  end
end

# Sample usage:
# Load data from JSON files at the beginning of your script
DataStorage.load_data('books.json', [])
DataStorage.load_data('people.json', [])
DataStorage.load_data('rentals.json', [])

# Your code for menu, input, and other functionality here
