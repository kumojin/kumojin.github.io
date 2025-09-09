FROM ruby:3.4.5@sha256:45ea53ecd8e1c0efee8919e03ccae460cf1aa8e47cd417a1fe77ea976dc00e49
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
