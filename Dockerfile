FROM ruby:3.4.5@sha256:8fc13ab79e1bf71da804040b587feca8cd9306c2f5def3a970e94f24f60cf97b
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
