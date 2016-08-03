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

  def update
    @job = Job.find(params[:id])
#    @job.if_sold = params[:if_sold]
    if @job.update(job_params)
      flash[:success] = "Job has been marked as completed"
      redirect_to @job
    else
      flash[:danger] = "Something went wrong!"
      redirect_to @job
    end
  end


  def destroy
  end

  private

    def job_params
      params.require(:job).permit(:content, :if_sold)
    end

end
