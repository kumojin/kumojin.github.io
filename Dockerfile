FROM ruby:3.3.6@sha256:e01de04a296437523eba5f548f7ffeb6bda9690096f6e3c6188a2f09f7485331
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
