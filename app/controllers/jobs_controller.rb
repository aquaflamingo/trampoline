# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: %i[show download]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def download
    dl = compose_job_download(@job)

    send_data(dl[:data], filename: dl[:filename], disposition: 'attachment')
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

  def compose_job_download(j)
    digest = Digest::MD5.hexdigest("#{j.title}_#{Time.now.to_i}")

    {
      data: j.to_downloadable,
      filename: "#{digest}_#{j.title}.txt"
    }
  end
end
