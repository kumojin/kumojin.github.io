FROM ruby:3.4.9@sha256:cddc8a7877ed0213dbd4a3cf726e357ac27e493fefa8b5350e7936f4ec02018e
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
