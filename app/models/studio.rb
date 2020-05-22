class Studio < ApplicationRecord
  has_many :movies

  def titles
    movies.pluck(:title).join(", ")
  end

end
