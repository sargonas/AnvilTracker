require 'rails_helper'

RSpec.describe Material, type: :model do
  subject(:material) { FactoryGirl.build(:material) }

  it 'should have a valid Factory' do
    expect(material).to be_valid
  end

  describe 'validations' do
    it 'should require a name' do
      material.name = nil
      expect(material).to_not be_valid
    end
  end
end
