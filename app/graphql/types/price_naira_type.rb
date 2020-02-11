# frozen_string_literal: true

module Types
  class PriceNairaType < BaseObject
    description 'Details of the calculated price in Naira'
    field :price, Float, null: false
    field :formatted_price, String, null: false
    field :time, String, null: false
  end
end
