# frozen_string_literal: true

RSpec.describe Types::QueryType do
  set_graphql_type

  it 'has a :calculate_price field of PriceNaira type' do
    # Ensure that the field calculate_price is of type PriceNaira
    expect(subject).to have_field(:calculate_price)
      .that_returns('PriceNaira!')
  end
end
