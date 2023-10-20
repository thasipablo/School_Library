require_relative '../lib/classroom'
require_relative '../lib/student'

describe Classroom do
  let(:classroom) { Classroom.new('Math 101') }
  let(:student) { Student.new(classroom, 16, 'Anna') }

  describe '#initialize' do
    it 'creates a Classroom with the provided label' do
      expect(classroom.label).to eq('Math 101')
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
