FROM ruby:3.4.7@sha256:8b60ef1d4853e1ecb76884e5f978a7c2c0e8de21daee36dd2038dff4d7447a7d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
