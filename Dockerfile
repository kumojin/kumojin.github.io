FROM ruby:3.4.7@sha256:2fb73b1b29f6c3f404982db32c7808d0edc09d1bfd6071d303d09c0d3a6c9896
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
