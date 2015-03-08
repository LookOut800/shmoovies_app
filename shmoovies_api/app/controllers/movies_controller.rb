require 'pry'

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: @movies
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.where(tmbd_id: params[:id])
    render json: @movie, status: 200
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      render json: @movie, status: :ok
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    @movie = Movie.all
    render json: @movie, status: 202
  end


    private

    def movie_params
      params.require(:movie).permit(:tmbd_id)
    end


end

