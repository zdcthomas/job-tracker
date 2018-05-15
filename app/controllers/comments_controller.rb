class CommentsController < ApplicationController
  def create
    job = Job.find(params[:job_id])
    company = Company.find(job.company.id)
    comment = job.comments.new(comment_params)
    if comment.save
      redirect_to company_job_path(company, job)
    else
      redirect_to company_job_path(company, job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id,)
  end
end