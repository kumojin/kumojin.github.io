FROM ruby:3.3.5@sha256:94fc17fdff352ae694ea4a8c7c7037cbb90a02a2b5b1ad6c803bd86a87816c2d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
