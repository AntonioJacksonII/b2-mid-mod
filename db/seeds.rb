# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
