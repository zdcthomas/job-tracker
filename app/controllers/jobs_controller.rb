class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    else
      @jobs = Job.all
    end
  end

  def new
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @job = Job.new()
    else
      @job = Job.new()
    end
  end

  def create
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @job = @company.jobs.new(job_params)
      if @job.save
        flash[:success] = "You created #{@job.title} at #{@company.name}"
        redirect_to company_job_path(@company, @job)
      else
        redirect_to new_company_job_path
      end
    else
      @job = Job.new(job_params)
      if @job.save
        flash[:success] = "You created #{@job.title}"
        redirect_to job_path(@job)
      else
        redirect_to new_job_path
      end
    end
  end

  def show
    if params[:company_id]
      @comment = Comment.new
      @comments = Comment.all.order(created_at: :desc)
    else

    end
  end

  def edit
    if params[:company_id]
      @company = Company.find(params[:company_id])
    else

    end
  end

  def update
    if params[:company_id]
      @job.update(job_params)
      if @job.save
        flash[:success] = "#{@job.title} updated!"
        redirect_to company_job_path
      else
        render :edit
      end
    else

    end
  end

  def destroy
    if params[:company_id]
      @job.destroy
    redirect_to company_jobs_path
    else

    end
  end

  private

  def job_params
    params.require(:job).permit(:company_id, :category_id, :title, :description, :level_of_interest, :city)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
