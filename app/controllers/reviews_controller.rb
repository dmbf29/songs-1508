class ReviewsController < ApplicationController
  before_action :set_song, only: [:new, :create]

  def new
    # we already have @song
    @review = Review.new
  end

  def create
    # we already have @song
    @review = Review.new(review_params)
    @review.song = @song
    if @review.save
      redirect_to song_path(@song)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_song
    @song = Song.find(params[:song_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
