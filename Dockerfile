FROM ruby:3.4.3@sha256:07c880a5e0fd72fa6cf0ff353633c488899082839578776201266e5f9fa95de0
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
