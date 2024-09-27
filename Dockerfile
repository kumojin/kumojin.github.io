FROM ruby:3.3.5@sha256:7db7ad0a9f70a908d9468d069c77f50090e8811cd5ce146fa85f4db02f79a097
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
