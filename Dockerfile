FROM ruby:3.3.4@sha256:e4cef9d50f7f97dcb3b6efa9d6d66814d3974d7eca3d1ec64efd810afdc53c35
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
