FROM ruby:3.3.6@sha256:8581b198d720f4f02f86644ceaa2a38e7e9451ce53db725b53a7e31675d60281
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
