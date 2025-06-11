FROM ruby:3.4.4@sha256:9e5cc680667deb73b3a6bcbf0807a89a645da620febe665b8cb925f122139394
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
