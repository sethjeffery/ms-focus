require 'basket'

class Api::BasketsController < Api::ApiController
  before_action :fetch_basket

  def add
    @basket.add(params[:code])
    render 'show'
  end

  def remove
    @basket.remove(params[:code])
    render 'show'
  end

  private

  def fetch_basket
    @basket ||= Basket.new
  end
end
