FROM ruby:3.4.7@sha256:9e6475a5f7956ced924a6fb359180f824fb139142284c8929bac56f47fe7d143
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
