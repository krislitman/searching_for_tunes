require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:spotify_id) }
    it { should validate_uniqueness_of(:spotify_id) }
    it { should validate_presence_of(:artist_type) }
  end

  describe 'Relationships' do
    it { should have_many(:artist_albums) }
    it { should have_many(:albums).through(:artist_albums) }
  end
end
