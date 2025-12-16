FROM ruby:3.4.7@sha256:779ca68b84fe3804e27f5b7ea5ab001005c708b7236a798c15b860d71cba9d21
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
