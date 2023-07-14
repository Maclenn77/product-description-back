require "pry"

class DescriptionsController < ApplicationController
  include AdsGenerator

  before_action :set_description, only: %i[ show update destroy ]

  # GET /descriptions
  def index
    @descriptions = Description.all

    render json: @descriptions
  end

  # GET /descriptions/1
  def show
    render json: @description
  end

  # POST /descriptions
  def create
    @product = Product.find(params["product_id"])
    params = description_params
    @description = @product.description.build(params)
    response = generate_content(@description)
    @description.result = JSON.parse(response.body)["choices"].dig(0,"text")

    if @description.save
      render json: @product.description.last, status: :created
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /descriptions/1
  def update
    if @description.update(description_params)
      render json: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  # DELETE /descriptions/1
  def destroy
    @description.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description
      @description = Description.find(params[:id])
    end

    def description_params
      { segment: params["segment"], season: params["season"],
        keywords: params["keywords"], usage: params["usage"], 
        creativity: params["creativity"] 
      }
    end
end
