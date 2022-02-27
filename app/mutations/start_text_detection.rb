class StartTextDetection < Mutations::Command
  required do
    model :job
  end

  def validate
    add_error(:job, :no_upload, "Job is missing attached upload") if job.upload.bank?
  end 

  def execute
    res = @vision_client.detect_text(job.upload.url)

    Run.create!(
      job: job,
      resolved_text: res.text
    )
  end

  private
  def vision_client
    GoogleCloudVisionClient.instance
  end
end
