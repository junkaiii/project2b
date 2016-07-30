class StaticPagesController < ApplicationController
  def index
    @jobshow = Job.paginate(page: params[:page])
    # @job = current_user.job.build if logged_in?
  end
end
