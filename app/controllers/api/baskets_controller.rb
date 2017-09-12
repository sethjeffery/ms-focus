class Api::BasketsController < Api::ApiController
  def add
    Basket.add(params[:code])
    head :created
  end

  def remove
    Basket.remove(params[:code])
    head :ok
  end
end
