module JobsHelper
  def job_maker?(job)
    job.user.id == current_user.id
  end
end
