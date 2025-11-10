FROM ruby:3.4.7@sha256:88ce517a2537f1255e97d2b290b6460036dc7b19dfed751b2e6d140d1c1d14b5
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
