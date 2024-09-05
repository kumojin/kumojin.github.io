FROM ruby:3.3.5@sha256:c9e1ded81d9c0579fd52bd53ed06ced514e4dde3296ee9a9e0805212f1ab6502
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
