FROM ruby:3.4.4@sha256:8b1e1f44f93f7906185349615b8a835a6ead1a6107a5a2ff4881371a610b236b
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
