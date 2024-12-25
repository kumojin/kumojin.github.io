FROM ruby:3.3.6@sha256:61edbafbac58696370a8ca2c4fd8c690d17dc1e9f363931ddedfa67be019a74d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
