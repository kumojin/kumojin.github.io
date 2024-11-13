FROM ruby:3.3.6@sha256:b2f8c67a6db2d899f40bb02adf36e1253b4a8ad1663802ffd6217442bca741aa
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
