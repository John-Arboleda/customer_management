require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'is associated to city' do
    it { should belong_to(:city) }
  end

  describe 'is valid with valid attributes' do
    it { should validate_presence_of(:name) }
  end

  describe 'name_format' do
    it 'should start with uppercase' do
      client = Client.new(name: 'paco')
      client.valid?
      expect(client.errors[:name]).to include('should start with uppercase')
    end

    it 'should only allows letters and spaces' do
      client = Client.new(name: 'Paco!')
      client.valid?
      expect(client.errors[:name]).to include('only allows letters and spaces')
    end
  end
end
