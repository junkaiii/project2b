class ReviewsController < ApplicationController
  before_action :find_job
  before_action :job_creator, only: [:create]

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.job_id = @job.id
    @review.user_id = current_user.id
    # @reviewpost = @job.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to @job
    else
      render 'static_pages/index'
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

    #finds job id within url
    def find_job
      @job = Job.find(params[:job_id])
    end

    # returns false if either review has been made or user is trying to post a review to a job he created
    def job_creator
      @job.reviews.empty? && @job.user.id != current_user.id
    end
    
end
