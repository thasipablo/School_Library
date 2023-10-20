require_relative '../lib/teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Algorithms', 35, 'Pedro') }

  describe '#initialize' do
    it 'creates a Teacher with the provided specialization, age, and name' do
      expect(teacher.specialization).to eq('Algorithms')
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('Pedro')
    end

    it 'defaults to having parent permission' do
      expect(teacher.parent_permission).to be(true)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
