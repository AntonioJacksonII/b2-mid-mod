class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.average_age
    average(:age)
  end

  def costars
    stars = movies.map{ |movie| movie.actors.pluck(:name)}.flatten.uniq
    stars.delete(name)
    stars.join(", ")
  end
end
