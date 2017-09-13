module Formatted
  extend ActiveSupport::Concern

  included do
    include ActionView::Helpers::NumberHelper
  end

  def format(number)
    ActiveSupport::NumberHelper.number_to_currency(number.to_f / 100, unit: '£')
  end

end
