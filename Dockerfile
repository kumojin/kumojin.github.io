FROM ruby:3.4.9@sha256:09537a8b7ebf740bbbeb7dcdc0a0aff59eea2e4accca2cfdd2328e4a4bf22f9e
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
