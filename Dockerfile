FROM ruby:3.4.9@sha256:ec3a4b139bb18412233444c725069d3134c58d8855efc2d9d92aac593e4bc0fb
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
