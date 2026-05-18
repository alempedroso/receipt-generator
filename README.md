# Receipt Generator

A simple receipt generator that calculates and applies sales taxes to purchased goods.

## Requirements

- Ruby 4.0.4

## Container setup

This app can be run via `Docker` or other container engines. Commands for running the application via container are given along with local commands.

Build the image:

```sh
make build
```

To remove the image afterwards:

```sh
make clean
```

## Running the application

Install the dependencies:

```sh
bundle install
```

Run the application with use cases:

```sh
ruby main.rb
# `make run` if using container
```

Run the tests:

```sh
bundle exec rspec
# `make test` if using container
```

## Assumptions

- **Item schema for the purchased goods** — retail systems typically split goods across multiple schemas (categories, products, SKUs, etc.), but the challenge lacks sufficient data to justify that complexity.
- **Tax application inferred from item name** — in production, product data should be rich enough to classify goods explicitly. Name-based inference is error prone and it's used here only for simplicity.
- **Integer cents for money** — floats are avoided due to rounding issues with floating point arithmetic. Tax calculations involve interim floats, but values are converted back to integer cents immediately. The expected results were not altered. [See more](https://blog.codeminer42.com/be-cool-dont-use-float-double-for-storing-monetary-values/)

## Project Structure

- `app/schemas/` — domain objects
- `app/services/` — business logic
- `app/utils/` — shared utilities
- `app/receipt_generator.rb` — application entrypoint
- `purchases/` — sample input files
- `spec/` — test suite, mirroring the `app/` structure

## Sample from running `ruby main.rb`

```
➜  receipt-generator git:(main) ruby main.rb
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32

1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15

1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```
