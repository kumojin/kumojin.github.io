FROM ruby:3.4.9@sha256:4d5bca2cfe8c6b93d944a6ca6c7f28fcae32aaf6b52a84d7b21bb37ae66ad98b
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
