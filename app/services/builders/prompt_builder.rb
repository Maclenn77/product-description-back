# frozen_string_literal: true

module Builders
  # A builder for prompts
  class PromptBuilder

    def build(description)
        product = description.product

        @config = {
            product: {
              name: product.name,
              base_description: product.base_description,
              characteristics; product.characteristics
            },
            description: {
              segment: description.segment,
              season: description.season,
              keywords: description.keywords,
              usage: description.usage,
              language: description.language
            }
        }
    end
  end
end