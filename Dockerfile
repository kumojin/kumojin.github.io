FROM ruby:3.4.5@sha256:83a4a1b31f0723931d8dc68b6a716eb6643e0ea2b8c80eda943eea730179c934
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
