FROM ruby:3.4.6@sha256:2b2a9024cd72c6ed415f25330a08d921af02ece06dbc310eef220b626ad97d89
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
