FROM ruby:3.4.4@sha256:ffa7dd9e0536e352b08e6a399035a2d7a1cc1b2659b66017fb2de669dbefb5e3
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
