require 'rails_helper'

describe "Movie Show Page", type: :feature do
  before :each do
    @cbs = Studio.create(name: "CBS Studios", location: "Los Angeles")
    @abc = Studio.create(name: "ABC Studios", location: "Glendale")
    @columbia = Studio.create(name: "Columbia Pictures", location: "New York")

    @apes = @cbs.movies.create!(title: "Planet of the Apes", year: "2000", genre: "Science Fiction")
    @mean = @cbs.movies.create!(title: "Mean Girls", year: "2010", genre: "Comedy")
    @godfather = @columbia.movies.create!(title: "The Godfather", year: "1980", genre: "Action")
    @prada = @abc.movies.create!(title: "The Devil Wears Prada", year: "2003", genre: "Fashion")

    @meryl = Actor.create!(name: "Meryl Streep", age: 70)
    @anne = Actor.create!(name: "Anne Hathaway", age: 30)
    @lohan = Actor.create!(name: "Lindsay Lohan", age: 20)
    @al = Actor.create!(name: "Al Pacino", age: 80)


    MovieActor.create!(movie: @apes, actor: @lohan)
    MovieActor.create!(movie: @apes, actor: @anne)
    MovieActor.create!(movie: @mean, actor: @lohan)
    MovieActor.create!(movie: @mean, actor: @anne)
    MovieActor.create!(movie: @prada, actor: @meryl)
    MovieActor.create!(movie: @prada, actor: @anne)
    MovieActor.create!(movie: @godfather, actor: @meryl)
    MovieActor.create!(movie: @godfather, actor: @al)
  end

  it 'it shows the movie’s title, creation year, genre, list of all its actors from youngest to oldest, and average age of all actors' do
    visit "/movies/#{@apes.id}"

    expect(page).to have_content("Planet of the Apes")
    expect(page).to have_content("Year: 2000")
    expect(page).to have_content("Genre: Science Fiction")
    expect(page).to have_content("Actors: Lindsay Lohan, Anne Hathaway")
    expect(page).to have_content("Average Actor Age: 25")

    visit "/movies/#{@godfather.id}"

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Year: 1980")
    expect(page).to have_content("Genre: Action")
    expect(page).to have_content("Actors: Meryl Streep, Al Pacino")
    expect(page).to have_content("Average Actor Age: 75")

  end
end

# As a visitor,
# When I visit a movie’s show page.
# I see the movie’s title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie’s actors
