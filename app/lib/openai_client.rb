class OpenAIClient
  ENGINE_DAVINCI = 'text-davinci-001'.freeze

  def initialize(profile)
    OpenAI::Config.configure do |c|
      c.access_token = profile.openai_credentials
    end

    @config ||= OpenAI.configuration
    @client = OpenAI::Client.new(access_token: @config.access_token)
  end

  def interpret(text)
    response = @client.completions(
      engine: ENGINE_DAVINCI,
      parameters: {
        prompt: autocorrect_prompt(text), max_tokens: text.size
      }
    )

    response.parsed_response
  end


  private 
  def autocorrect_prompt(corpus)
  <<-EOM
Perform grammer, spelling and auto-correct to the following text passage:

#{corpus}
  EOM
  end
end
