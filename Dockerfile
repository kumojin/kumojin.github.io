FROM ruby:4.0.1@sha256:36ec449d363dbe7ddb7784a12934a01880fd3a86f6bf059dc1f87f0d83afc953
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
