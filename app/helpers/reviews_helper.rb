module ReviewsHelper
  def job_creator?(job)
    job.reviews.empty? && job.user.id != current_user.id
  end
  
end
