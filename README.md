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
