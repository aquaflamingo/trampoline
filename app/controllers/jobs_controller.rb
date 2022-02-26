class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show; end

  def create
    @j = Job.new(job_params)

    if @j.save
      redirect_to @j, success: 'job created'
    else
      flash.now[:warning] = "Failed to create job: #{@j.errors.full_messages.join('. ')}"

      render 'new'
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :upload)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
