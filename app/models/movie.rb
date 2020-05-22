class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def stars
    actors.order(:age).pluck(:name).join(", ")
  end
end
