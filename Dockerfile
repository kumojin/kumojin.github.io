FROM ruby:3.4.4@sha256:e08e271f196cf578ea73e00baa572d76d2dc5a7d5c2bd1151f90a364c9cc4a4f
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
