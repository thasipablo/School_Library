require_relative '../lib/student'
require_relative '../lib/classroom'
require 'date'

describe Student do
  let(:classroom) { Classroom.new('Math 101') }
  let(:student) { Student.new(classroom, 16, 'Paolo') }

  describe '#initialize' do
    it 'creates a Student with the provided classroom, age, and name' do
      expect(student.classroom).to eq(classroom)
      expect(student.age).to eq(16)
      expect(student.name).to eq('Paolo')
    end

    it 'defaults to having parent permission' do
      expect(student.parent_permission).to be(true)
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
