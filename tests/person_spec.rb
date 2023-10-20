require_relative '../lib/person'
require_relative '../lib/rental'
require_relative '../lib/book'
require 'date'

describe Person do
  let(:person) { Person.new(25, 'John', parent_permission: true) }
  let(:book) { Book.new('Sample Book', 'John Doe') }

  describe 'initialization' do
    it 'initializes a person with the provided age, name, and parent permission' do
      expect(person.age).to eq(25)
      expect(person.name).to eq('John')
      expect(person.parent_permission).to be(true)
      expect(person.id).to be_between(1, 1000)
    end
  end

  describe '#can_use_services?' do
    it 'returns true when the person is of age' do
      person.age = 21
      expect(person.can_use_services?).to be(true)
    end

    it 'returns true when the person has parent permission' do
      person.parent_permission = true
      expect(person.can_use_services?).to be(true)
    end

    it 'returns false when the person is under 18 and has no parent permission' do
      person.age = 15
      person.parent_permission = false
      expect(person.can_use_services?).to be(false)
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person' do
      rental_date = Date.new(2023, 10, 19)
      person.add_rental(rental_date, book)
      expect(person.rentals.length).to eq(1)
    end
  end

  describe '#description' do
    it 'returns a formatted description of the person' do
      expect(person.description).to eq("[Person] Name: John, ID: #{person.id}, Age: 25")
    end
  end

  describe '#rentals_description' do
    it 'prints the rentals' do
      person.add_rental(Date.today, book)
      expect { person.rentals_description }.to output(/Date: .* Book 'Sample Book' by John Doe/).to_stdout
    end

    it 'prints "No record found" when there are no rentals' do
      expect { person.rentals_description }.to output("No record found\n").to_stdout
    end
  end

  describe '#filter_user_rentals' do
    it 'filters rentals for a specific person' do
      book1 = Book.new('Dev', 'Louis')
      book2 = Book.new('The glossy ruby', 'Violet')
      book3 = Book.new('Once upon a time', 'Claude')

      rental1 = Rental.new('2023-10-20', book1, person)
      rental2 = Rental.new('2023-10-21', book2, person)
      rental3 = Rental.new('2023-10-22', book3, Person.new(12, 'Odette'))

      rentals = [rental1, rental2, rental3]
      filtered_rentals = person.filter_user_rentals(rentals, person.id)

      expect(filtered_rentals).not_to include(rental3)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person.name = 'Alice'
      expect(person.correct_name).to eq('Alice')
    end
  end
end
