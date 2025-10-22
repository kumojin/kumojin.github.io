FROM ruby:3.4.7@sha256:4bef3ee023c0525189f1907ac256bc4511cc9ef4d5dc088c20b5c5a478638e28
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
