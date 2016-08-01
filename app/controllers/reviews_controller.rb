class ReviewsController < ApplicationController


  def index

  end

  def new
    @reviewpost = Review.new

  end

  def create
    @reviewpost = Review.new(review_params)
    @reviewpost.user_id = current_user.id
    @reviewpost.job_id = params[:id]
    # @reviewpost = @job.reviews.build(review_params)
    if @reviewpost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
  end

  def delete
  end

  private

    def review_params
      params.require(:review).permit(:content, :user_id, :job_id)
    end


end
