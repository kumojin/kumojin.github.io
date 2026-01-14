FROM ruby:3.4.8@sha256:40b615a7ae6859d6ff82cc389e9b1ea673f2683a035da2c48e1ef203f7c1fe52
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
