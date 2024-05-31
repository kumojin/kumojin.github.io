FROM ruby:3.3.2@sha256:6351ddbd3fa453d8b9bd8597d3eaafc500b6d5248c67d5f8d1d2ac42b5fca10d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
