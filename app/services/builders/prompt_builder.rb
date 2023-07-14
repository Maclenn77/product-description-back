# frozen_string_literal: true
require_relative '../prompt'

module Builders
  # A builder for prompts
  class PromptBuilder

    attr_reader :config

    def initialize(description)
        product = description.product

        @config = {
            product: {
              name: product.name,
              base_description: product.base_description,
              categories: product.categories,
              characteristics: product.characteristics
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

    def build
      prompt = Prompt.new(config)
      
      prompt.with_base_description if base_description?
      
      prompt.with_categories if categories?

      prompt.with_segment if segment?

      prompt.with_season if categories?

      prompt.with_keywords if keywords?

      prompt.with_language if language?

      prompt.final_prompt
    end

    private

    def base_description? = config.dig(:product, :base_description).present?

    def categories? = config.dig(:product, :categories).present?

    def characteristics? = config.dig(:product, :characteristics).present?

    def segment? = config.dig(:product, :segment).present? ? false : true

    def season? = config.dig(:product, :season).present?
    
    def keywords? = config.dig(:product, :keywords).present?

    def language? = config.dig(:product, :language).present?

  end
end