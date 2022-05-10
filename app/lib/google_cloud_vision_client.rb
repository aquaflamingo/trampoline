# frozen_string_literal: true

require 'ostruct'
require 'singleton'
require 'google/cloud/vision'

class GoogleCloudVisionClient
  def initialize(profile)
    Google::Cloud::Vision.configure do |c|
      c.credentials = profile.gcp_credentials
    end

    @annotator_client = Google::Cloud::Vision.image_annotator
  end

  def detect_text(path)
    # Make the API call via SDK
    response = client.document_text_detection image: path

    # Iterate through response
    response.responses.map do |res|
      OpenStruct.new(
        text: res.text_annotations.map(&:descriptions)
      )
    end
  end
end
