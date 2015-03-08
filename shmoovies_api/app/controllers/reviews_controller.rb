require 'pry'
class ReviewsController < ApplicationController
  def index
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @reviews = @movie.reviews
      render json: @reviews, status: :ok
    else
      @reviews = Review.all
      render json: @reviews, status: :ok
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @movie.reviews << @review
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      render json: @review, status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    head :no_content
  end

  private
  def review_params
    params.require(:review).permit(:author, :body, :rating)
  end
end
