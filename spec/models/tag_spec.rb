require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject(:tag) { FactoryGirl.build(:tag) }

  it 'should have a valid Factory' do
    expect(tag).to be_valid
  end
end
