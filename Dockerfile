FROM ruby:3.3.5@sha256:acab8db845b3de8c085076410f3f158aff2c2846cb4bf0ad8819facb1bf13a14
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
