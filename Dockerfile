FROM ruby:3.4.3@sha256:6adb999a22072227ba4ddfce8746959deb3a14bc9e32ad55e9723f5b3995aa94
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
