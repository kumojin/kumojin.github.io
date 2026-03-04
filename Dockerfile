FROM ruby:4.0.1@sha256:66302616aabd939350e9bd7bc31ccad5ef993a5ba5e93f0cc029bb82e80a8d3b
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
