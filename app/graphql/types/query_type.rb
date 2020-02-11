# frozen_string_literal: true

require 'rest-client'
require 'json'

module Types
  class QueryType < Types::BaseObject
    graphql_name 'Calculate Price'
    description 'The query fetches the current price of bitcoin in USD from `https://api.coindesk.com/v1/bpi/currentprice.json` and converts to Naira using provided transaction type and custom (USD/NGN) exchange rate'
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :calculate_price, PriceNairaType, null: false do
      argument :type, TransactionType, required: true
      argument :margin, Float, required: true
      argument :exchange_rate, Float, required: true
    end
    def helpers
      ActionController::Base.helpers
    end

    def calculate_price(type: nil, margin: nil, exchange_rate: nil)
      response = RestClient.get 'https://api.coindesk.com/v1/bpi/currentprice.json'
      bitcoin_price = JSON.parse(response)['bpi']['USD']['rate_float']
      # puts helpers.number_to_currency(bitcoin_price, unit: '₦')
      commission = (bitcoin_price * margin / 100)
      final_price = 0
      if type == 'buy'
        final_price = (bitcoin_price + commission) * exchange_rate
      elsif type == 'sell'
        final_price = (bitcoin_price - commission) * exchange_rate
      end
      {
        price: final_price,
        formatted_price: helpers.number_to_currency(final_price, unit: '₦'),
        time: JSON.parse(response)['time']['updated']
      }
    end
  end
end
