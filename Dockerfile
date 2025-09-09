FROM ruby:3.4.5@sha256:927c31977ff915395c1782115e0701d3f1c5d2f62b980215ff1f287e8b784612
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
