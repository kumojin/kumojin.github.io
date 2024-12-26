FROM ruby:3.3.6@sha256:4c290398322e29e9066134b57562a97ef46261500f1e921c320f0edee9e7cc3f
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
