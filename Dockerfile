FROM ruby:3.3.3@sha256:3acb1a3f2351748d7ffd4408b179adb96682a93a4a76f30abcb9eb001d95443f
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
