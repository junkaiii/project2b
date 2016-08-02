class JobsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]

  def new
    @job = current_user.jobs.build if logged_in?
  end

  def show
    @job = Job.find(params[:id])
    @reviews = @job.reviews.paginate(page: params[:page])
  end

  # def index
  #   @jobs = Job.paginate(page: params[:page])
  # end

  def index
    @jobs = Job.paginate(page: params[:page])
      if params[:search]
        @jobs = Job.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
      else
        @jobs = Job.all.order('created_at DESC').paginate(page: params[:page])
    end
  end

  def create
    @job = current_user.jobs.build(job_params) if logged_in?
    if @job.save
      flash[:success] = "Job Created Successfully"
      redirect_to root_url
    else
      render :new
    end

  end

  def destroy
  end

  private

    def job_params
      params.require(:job).permit(:content)
    end

end
