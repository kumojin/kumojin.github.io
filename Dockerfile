FROM ruby:3.3.4@sha256:0bf712ba12549864ccbc3fe092c2684ed1542138727a219729052942725c1498
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
