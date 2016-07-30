class StaticPagesController < ApplicationController
  
  def index
    @jobshow = Job.paginate(page: params[:page])
  end


end
