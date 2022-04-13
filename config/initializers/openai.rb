require "#{Rails.root}/app/lib/openai"

OpenAI::Config.configure do |c|
  c.access_token = Rails.application.credentials.openai.access_token
end
