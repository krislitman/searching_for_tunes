require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:spotify_id) }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:album_type) }
  end
end
