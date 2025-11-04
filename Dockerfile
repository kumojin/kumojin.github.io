FROM ruby:3.4.7@sha256:01d4dc562a03ba11669ba17accaee7b06c0b458fe87b09b9f8523a331310eae6
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
