require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :actors}
  end
end
