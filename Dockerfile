FROM ruby:3.3.6@sha256:121059b220a7ea9f72617d4d4824ab7722a933a9810bafe91d9724ea8dd60c50
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
