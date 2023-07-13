# frozen_string_literal: true

# Create Ads with given params
module AdsGenerator
  extend ActiveSupport::Concern

  included do
    # Request a description
    def generate_content(description)
      creativity_level = description.creativity
      client = OpenAIClient.new

      prompt = create_prompt(description)

      response = client.generate_ad(prompt, creativity_level)
      binding.pry
      response
    end
  end

  def create_prompt(description)
    product = description.product
    basic_prompt = "Create a #{description.usage} for a product named #{product.name} that belongs to #{handle_empty(product.categories)} categories 
                    targeted to #{handle_empty(description.segment)} segment for #{handle_empty(description.season)}. Include #{description.keywords} keywords
                    and finish with a call-to-action"
    end

    def handle_empty(attributes) = attributes.empty? ? "any" : display(attributes)

    def display(attributes) = attributes.instance_of?(Array) attribute.join(' ') : attributes
end