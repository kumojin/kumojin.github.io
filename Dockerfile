FROM ruby:3.3.5@sha256:a2e7cabf8a721916a59853ed1586785310feb1c5ef3f5476886831a60ae12aef
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
