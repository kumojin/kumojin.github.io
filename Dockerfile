FROM ruby:3.3.6@sha256:24a180b1727b169cdfab0acc2b2b70acaa1eca050e5379297eeaf7aa58e8416a
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
