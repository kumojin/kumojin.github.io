FROM ruby:3.3.6@sha256:495740de96f6a2608388a961612447690f752d0f7f893357f870cd29d0700351
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
