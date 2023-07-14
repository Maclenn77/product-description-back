# frozen_string_literal: true
require_relative '../../services/api/openai_client'
require_relative '../../services/builders/prompt_builder'


# Create Ads with given params
module AdsGenerator
  extend ActiveSupport::Concern

  included do
    # Request a description
    def generate_content(description)
      creativity_level = description.creativity
      client = Api::OpenAIClient.new

      prompt = create_prompt(description)
      response = client.generate_ad(prompt, creativity_level)

      response
    end
  end

  def create_prompt(description)
    builder = Builders::PromptBuilder.new(description)

    builder.build    
  end

  private

  def handle_empty(attributes) = attributes.empty? ? "any" : display(attributes)
        
  def display(attributes) = attributes.instance_of?(Array) ? attributes.join(' ') : attributes
end