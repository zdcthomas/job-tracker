class CommentsController < ApplicationController
  def create
    job = Job.find(params[:job_id])
    company = job.company
    comment = Comment.new(params[:content])
    if comment.save
      redirect_to company_job_path(company, job)
    else
      redirect_to company_job_path(company, job)
    end
  end
end 