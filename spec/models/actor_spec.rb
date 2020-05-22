require 'rails_helper'

describe Actor, type: :model do
  describe 'relationships' do
    it {should have_many :movies}
  end
end
