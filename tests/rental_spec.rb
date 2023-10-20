# spec/tests/rental_spec.rb

require_relative '../lib/rental'
require_relative '../lib/book'
require_relative '../lib/person'

describe Rental do
  let(:book) { Book.new('Sample Book', 'John Doe') }
  let(:person) { Person.new(25, 'Alice') }

  describe '#initialize' do
    it 'creates a new Rental object' do
      rental = Rental.new('2023/10/19', book, person)

      expect(rental).to be_an_instance_of(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
