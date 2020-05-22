require 'rails_helper'

describe "Studio Index Page", type: :feature do
  before :each do
    @cbs = Studio.create(name: "CBS Studios", location: "Los Angeles")
    @abc = Studio.create(name: "ABC Studios", location: "Glendale")
    @columbia = Studio.create(name: "Columbia Pictures", location: "New York")

    @apes = @cbs.movies.create!(title: "Planet of the Apes", year: "2000", genre: "Science Fiction")
    @mean = @cbs.movies.create!(title: "Mean Girls", year: "2010", genre: "Comedy")
    @godfather = @columbia.movies.create!(title: "The Godfather", year: "1980", genre: "Action")
    @prada = @abc.movies.create!(title: "The Devil Wears Prada", year: "2003", genre: "Fashion")

    visit "/studios"
  end

  it 'it shows a list of all movie studios with their movies' do
    expect(page).to have_content("CBS Studios")
    expect(page).to have_content("Movies: Planet of the Apes, Mean Girls")

    expect(page).to have_content("ABC Studios")
    expect(page).to have_content("Movies: The Devil Wears Prada")

    expect(page).to have_content("Columbia Pictures")
    expect(page).to have_content("Movies: The Godfather")
  end
end
