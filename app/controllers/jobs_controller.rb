class JobsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]

  def new
    @job = current_user.jobs.build if logged_in?
  end

  def index
    @jobshow = Job.paginate(page: params[:page])
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
