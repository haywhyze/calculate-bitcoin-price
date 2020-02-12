# BuyCoins BackEnd Developer Challenge

The challenge is to create a GraphQL API with one query. The query `calculatePrice` accepts three required arguments:

- `type`: This can either be `buy` or `sell`, nothing else.
- `margin`: This is a percentage that will be used in a calculation. Not a fraction, a percentage. For example, if `0.2` is passed into this argument, then the calculation should be done with 0.2%.
- `exchangeRate`: This is a custom USD/NGN exchange rate that will be used in the calculation detailed below.

* Ruby version - 2.6.5
* Rails version - 6.0.2.1

## Getting started

To start the server run
`bundle exec rails server`

To run test suite run
`bundle exec rspec`

The API mounts a GraphiQL interface at `/graphiql`.
