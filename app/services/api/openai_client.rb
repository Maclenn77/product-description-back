# frozen_string_literal: true

module Api
class OpenAIClient 
    BASE_URL = 'https://api.openai.com/v1/completions'
    API_KEY = ENV.fetch('OPENAI_API_KEY')
    CREATIVITY_LEVEL = { "high": 1.25,
                         "moderate-high": 1,
                         "moderate": 0.75,
                         "moderate-low": 0.5,
                         "low": 0.25}

    # Create a Faraday Client to connect with OPENAI API
    def initialize
        @conn = Faraday.new(BASE_URL) do |faraday|
            faraday.headers['Content-Type'] = 'application/json'
            faraday.headers['Authorization'] = "Bearer #{API_KEY}"
            faraday.adapter Faraday.default_adapter
        end
    end

    def generate_ad(prompt, creativity = "moderate-high")
        creativity_level = CREATIVITY_LEVEL[creativity]

        @conn.post('') { |req| req.body = create_params(prompt, creativity_level).to_json }
    end

    def create_params(prompt, temp)
        temp = temp.nil? ? 1.0 : temp

        {
          model: "text-davinci-003",
          prompt: prompt,
          max_tokens: 1200,
          temperature: temp,
          top_p: 1,
          n: 1,
          stream: false,
          logprobs: nil,
          stop: ""
        }
    end
end
end