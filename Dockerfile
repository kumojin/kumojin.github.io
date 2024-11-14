FROM ruby:3.3.6@sha256:9afef279599922a4426c91d0a2a0d0c32c15ef0f65490ae83132a683d58ab978
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
