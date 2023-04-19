require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'is associated to clients' do
    it { should have_many(:clients).dependent(:nullify) }
  end

  describe 'is valid with valid attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'name_format' do
    it 'should start with uppercase' do
      city = City.new(name: 'madrid')
      city.valid?
      expect(city.errors[:name]).to include('should start with uppercase')
    end

    it 'should only allows letters and spaces' do
      city = City.new(name: 'Madrid!')
      city.valid?
      expect(city.errors[:name]).to include('only allows letters and spaces')
    end
  end
end
