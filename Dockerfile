FROM ruby:3.3.6@sha256:7738097e604fac41fd39eb0030ea0ed5b40968f89c6268911bc96e58c32e31fd
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
