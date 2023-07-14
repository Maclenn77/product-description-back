class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show update destroy ]

    # Index action

  # GET /products
     def index
       @products = Product.all.limit(20)

        render json: @products
     end
    
    # Create action
    def create
       @product = Product.new(product_params)

       if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def show
        render json: @product
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
