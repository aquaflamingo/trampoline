require 'ostruct' 
require 'singleton' 

class GoogleCloudVisionClient
  include Singleton

  def initialize
    @annotator_client = Google::Cloud::Vision.image_annotator
  end

  def detect_text(path)
    # Make the API call via SDK
    response = client.document_text_detection image: path

    # Iterate through response
    response.responses.map do |res|
      OpenStruct.new(
        text: res.text_annotations.map { |t| t.descriptions }
      )
    end
  end
end
