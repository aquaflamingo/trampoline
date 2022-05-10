# frozen_string_literal: true

class StartTextDetection < Mutations::Command
  required do
    model :job
  end

  def validate
    add_error(:job, :no_upload, 'Job is missing attached upload') if job.upload.bank?
  end

  def execute
    raw_res = @vision_client.detect_text(job.upload.url)
    parsed_response = @gpt3.interpret(raw_res)

    result = parsed_response['choices'].map { |c| c['text'] }.join('')

    Run.create!(
      job:,
      raw: raw_res.text,
      resolved_text: result,
      completed_at: Time.utc
    )
  end

  private

  def vision_client
    GoogleCloudVisionClient.instance
  end

  def gpt3
    OpenAiClient.instance
  end
end
