FROM ruby:3.3.6@sha256:d31b448100c85100876c4a5290375cca26e231d915d7a037599e33e02238560c
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
