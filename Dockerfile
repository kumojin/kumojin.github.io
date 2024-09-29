FROM ruby:3.3.5@sha256:dc4e58bf5fd54385441b663193275235a37d62b7f8c2cb58a5a043c1f830d1fd
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
