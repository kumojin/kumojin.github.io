FROM ruby:3.3.6@sha256:9a20ae3e08446b1fb8f6b3d1d5adae62d3d7ce35d87f9f261117dfc7970b61e2
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
