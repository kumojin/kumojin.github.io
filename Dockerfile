FROM ruby:3.3.4@sha256:4bea2a01b1c290fb4d571343285bd6e19d6dea8ca03887ecfcd417f4d362dd42
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
