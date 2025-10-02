FROM ruby:3.4.6@sha256:2de78cfbe28d99ee29c7a6b6d313617619d7fce68ed22337609f31a50cffc407
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
