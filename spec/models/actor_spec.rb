require 'rails_helper'

describe Actor, type: :model do
  describe 'relationships' do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end
end
