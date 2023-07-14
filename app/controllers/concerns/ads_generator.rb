# frozen_string_literal: true
require_relative '../../services/api/openai_client'

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
    product = description.product

    text = description.usage || "sell pitch"

    "Create a #{text} for a product named #{product.name} that belongs to #{handle_empty(product.categories)} categories targeted to #{handle_empty(description.segment)} segment for #{handle_empty(description.season)} season. Include #{handle_empty(description.keywords)} keywords and finish with a call-to-action. Answer in Spanish"
  end

  private

  def handle_empty(attributes) = attributes.empty? ? "any" : display(attributes)
        
  def display(attributes) = attributes.instance_of?(Array) ? attributes.join(' ') : attributes
end