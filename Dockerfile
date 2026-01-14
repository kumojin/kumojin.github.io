FROM ruby:4.0.1@sha256:21425a9d28f04c3021e69cf315778311063578c00c7791d265cdb15cbe2f1da2
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
