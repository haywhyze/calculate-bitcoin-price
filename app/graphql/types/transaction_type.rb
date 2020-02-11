# frozen_string_literal: true

module Types
  class TransactionType < BaseEnum
    graphql_name 'Transaction'
    description 'The type of transaction to be proccessed (buy/sell)'
    value 'buy', 'A user wants to buy bitcoin'
    value 'sell', 'A user wants to sell bitcoin'
  end
end
