FROM ruby:3.4.8@sha256:5c58050b16e00de92e7614bee88cd27865c0bdba262feb44aa838ae5da4431c9
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
