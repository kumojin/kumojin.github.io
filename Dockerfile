FROM ruby:3.3.3@sha256:e2891d64de047907f6346688a6f3c48a9ab06afe88229d1468eda6e5603ee3c3
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
