class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show update destroy ]

    # Create action
    def create
       @product = Product.new(product_params)

       if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:description).permit(:name, :categories, :characteristics)
    end

end
