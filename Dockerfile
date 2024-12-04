FROM ruby:3.3.6@sha256:02ada22fe5a5052d68de0a7b2285752bfb270c8f97e9f4ff4d10e42f54c196b9
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
