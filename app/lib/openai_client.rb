class OpenAIClient
  ENGINE_DAVINCI = 'text-davinci-001'.freeze

  def initialize
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
Perform grammer, spelling and autocorrection to the following text passage:

#{corpus}
  EOM
  end
end
