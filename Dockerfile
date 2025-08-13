FROM ruby:3.4.5@sha256:c4a4b497157a1e61ea26d26eea6d5b02d378fc8d1a9e76a2866c5c40c8f057b6
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
