FROM ruby:3.1.3@sha256:c4d28f375a0addcf2d6fc0ac59e1f2d9d6ed5a2531568c1b80c35627bcae5b21
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
