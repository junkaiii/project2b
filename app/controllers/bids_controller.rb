class BidsController < ApplicationController
  before_action :find_job

  def index
    @bids = @job.bids
  end

  def create
    @job = Job.find(params[:job_id])
    @bid = @job.bids.build(bid_params)
    @bid = Bid.new(bid_params)
    @bid.job_id = @job.id
    @bid.user_id = current_user.id
      # respond_to do |format|

    if @bid.save
      flash[:success] = "Bid submitted!"
      redirect_to @job
    else
      flash[:error] = "Bid is invalid!"
      redirect_to @job
      # render :template => 'jobs/show'
    end
  # end
  end

  def destroy
  end





  private

  def bid_params
    params.require(:bid).permit(:bids, :user_id, :job_id)
  end

  def find_job
    @job = Job.find(params[:job_id])
  end

end
