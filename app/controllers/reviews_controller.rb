class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!

  respond_to :html

  def new
    @review = current_user.reviews.build
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.movie_id = @movie.id
    @review.save
    respond_with(@movie)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
