FROM ruby:3.4.7@sha256:c8c6b151d7fdb7a5364e2790a58f7bea92d1b38a460078d0868864227174edcb
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
