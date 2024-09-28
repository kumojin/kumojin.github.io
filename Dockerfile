FROM ruby:3.3.5@sha256:1282b0b20c6855fbf4875ad0fb4cbe25050f19a39c0afc493ae49e73dbb67a2b
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
