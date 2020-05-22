class ActorsController < ApplicationController


  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.where(name: params[:name])
    movie.actors << actor
    redirect_to "/movies/#{movie.id}"
  end

  def show
    @actor = Actor.find(params[:actor_id])
  end
end
