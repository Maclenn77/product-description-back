# frozen_string_literal: true

class OpenAIClient 
    BASE_URL = 'https://api.openai.com/v1'
    API_KEY = ENV.fetch('OPENAI_API_KEY')
    CREATIVITY_LEVEL = { "high": 1.25,
                         "moderate-high": 1,
                         "moderate": .75,
                         "moderate-low": 0.5,
                         "low": 0.25}

    # Create a Faraday Client to connect with OPENAI API
    def init
        @conn = Faraday.new(BASE_URL) do |faraday|
            faraday.headers['Content-Type'] = 'application/json'
            faraday.headers['Authorization'] = "Bearer #{API_KEY}"
            faraday.adapter Faraday.default_adapter
        end
    end

    def generate_ad(prompt, creativity = "moderate-high")
        creativity_level = CREATIVITY_LEVEL[creativity]

        conn.post('engines/davinci-codex/completations') do |req|
            req.body = create_params(prompt, creativity_level)
        end
    end

    def create_params(prompt, temp = 1)
      {
        "prompt": prompt
        "temperature": temp.to_f,
        "max_tokens": 1000,
        "top_p": 1,
        "frequency_penalty": 0.4,
        "presence_penalty": 0
      }
    end

end