require 'rails_helper'

describe "Actor Show Page", type: :feature do
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

  it "it shows the actor's name, age, and actors worked with" do
    visit "/actors/#{@meryl.id}"

    expect(page).to have_content("Meryl Streep")
    expect(page).to have_content("Age: 70")
    expect(page).to have_content("Actors Worked With: Anne Hathaway, Al Pacino")

    visit "/actors/#{@anne.id}"

    expect(page).to have_content("Anne Hathaway")
    expect(page).to have_content("Age: 30")
    expect(page).to have_content("Actors Worked With: Lindsay Lohan, Meryl Streep")
  end
end

  # Story 4
  # As a visitor,
  # When I visit an actor's show page
  # I see that actors name and age
  # And I see a unique list of all of the actors this particular actor has worked with.
