FROM ruby:3.4.1@sha256:45ca46a37e16d4f0b383ff6f400edc7e096361ac05c91ead86481ecc332e665e
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
