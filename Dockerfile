FROM ruby:4.0.4-alpine3.23

RUN apk upgrade --no-cache

WORKDIR /app

COPY . .

RUN bundle install

CMD ["ruby", "main.rb"]
