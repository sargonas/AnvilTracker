require 'rails_helper'

RSpec.describe Filament, type: :model do
  subject(:filament) { FactoryGirl.build(:filament) }

  it 'should have a valid Factory' do
    expect(filament).to be_valid
  end

  describe 'validations' do
    it 'should require a name' do
      filament.name = nil
      expect(filament).to_not be_valid
    end

    it 'should require a color' do
      filament.color = nil
      expect(filament).to_not be_valid
    end

    it 'should require a material_id' do
      filament.material_id = nil
      expect(filament).to_not be_valid
    end

    it 'should require a length' do
      filament.length = nil
      expect(filament).to_not be_valid
    end

    it 'should require a weight' do
      filament.weight = nil
      expect(filament).to_not be_valid
    end

    it 'should require a cost' do
      filament.cost = nil
      expect(filament).to_not be_valid
    end

    it 'should require a diameter' do
      filament.diameter = nil
      expect(filament).to_not be_valid
    end

    it 'should require a user_id' do
      filament.user_id = nil
      expect(filament).to_not be_valid
    end

    describe 'associations' do
      it 'has belongs to a user' do
        ar = described_class.reflect_on_association(:user)
        expect(ar.macro) == :belongs_to
      end

      it 'has belongs to a material' do
        ar = described_class.reflect_on_association(:material)
        expect(ar.macro) == :belongs_to
      end

      it 'has many prints' do
        ar = described_class.reflect_on_association(:prints)
        expect(ar.macro) == :has_many
      end
    end

    specify '#import' do
      class DummyFile
        def path
          File.new(File.join(Rails.root, 'spec', 'fixture_files', 'sample.csv'))
        end
      end

      user = FactoryGirl.create :user
      FactoryGirl.create :material

      expect do
        described_class.import(DummyFile.new, user.id)
      end.to change(Filament, :count).by 1
    end
  end
end
