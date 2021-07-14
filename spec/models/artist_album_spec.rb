require 'rails_helper'

RSpec.describe ArtistAlbum, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:artist) }
    it { is_expected.to belong_to(:album) }
  end
end
