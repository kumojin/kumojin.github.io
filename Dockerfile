FROM ruby:3.4.5@sha256:04121e637d449ec6a93b4f4d05eef7bd55be4ffb04391127cab0999676c2de47
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
