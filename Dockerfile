FROM ruby:3.3.5@sha256:82650d50d8e8a9d0cca7b251ddb1d9cd8ac0c5f6cbee9966cb013c13b853e259
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
