FROM ruby:4.0.0@sha256:dc2c036bad26999117e3b3872f30fa327d7f6830bc120f15ad639d61499f5ef8
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
