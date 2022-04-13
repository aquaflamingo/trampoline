Bundler.require 
require "google/cloud/vision"

Google::Cloud::Vision.configure do |c|
  c.credentials = Rails.application.credentials.gcp
end
