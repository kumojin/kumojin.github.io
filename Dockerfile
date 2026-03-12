FROM ruby:3.4.9@sha256:db06865ac42eb81d58a4338e2cb191666a563261325e7f6c90d97c15fab62f39
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
