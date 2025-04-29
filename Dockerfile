FROM ruby:3.4.3@sha256:428aee18473ce2c44ff81ed4e41d74b9f9683f9b58c788032ae8759380f83e5a
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
