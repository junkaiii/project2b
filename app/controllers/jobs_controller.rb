class JobsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      flash[:success] = "Job Created Successfully"
      redirect_to root_url
    else
      flash[:danger] = "Something went wrong. Try again."
      redirect_to root_url
    end
  end

  def destroy
  end

  private

    def microposts_params
      params.require(:micropost).permit(:contest)
    end

end
