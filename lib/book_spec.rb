require_relative '../lib/book'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new book with title and author' do
      book = Book.new('Sample Book', 'John Doe')
      expect(book.title).to eq('Sample Book')
      expect(book.author).to eq('John Doe')
    end

    it 'initializes an empty rentals array' do
      book = Book.new('Sample Book', 'John Doe')
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      book = Book.new('Sample Book', 'John Doe')
      rental = double('Rental')
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
