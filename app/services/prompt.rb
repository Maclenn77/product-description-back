# frozen_string_literal: true
require_relative 'builders/prompt_builder'

class Prompt
  attr_reader :config
  attr_accessor :prompt

  # Create a prompt
  def initialize(config)
    @config = config
    @prompt = base_prompt
  end

  def final_prompt = prompt

  def base_prompt
    text = config.dig(:description, :usage) || "sell pitch"

    "Create a #{text} for a product named #{config.dig(:product, :name)}"
  end

  def with_base_description
    @prompt += " that is #{config.dig(:product, :base_description)}"
  end

  def with_categories
    @prompt += ". Product belongs to #{config.dig(:product, :categories).join(' ')} categories"
  end

  def with_characteristics 
    @prompt += " and has the following characteristics: #{config.dig(:product, :characteristics)}"
  end

  def with_segment
    @prompt += ". Text is targeted to #{config.dig(:description, :segment)}"
  end

  def with_season
    @prompt += " for #{config.dig(:description, :season)}"
  end

  def with_keywords
    @prompt += " using these keywords: #{config.dig(:description, :keywords).join(' ')}"
  end

  def with_language
    @prompt += ". Write in #{config.dig(:description, :language)}"
  end

  def add_call_to_action
    @prompt += ". Add a call to action"
  end
end