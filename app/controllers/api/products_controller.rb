class Api::ProductsController < Api::ApiController
  def index
    @products = Product.all
  end
end
