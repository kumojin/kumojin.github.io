FROM ruby:3.4.5@sha256:8b541f8279f3e960c74ff31fb8fd523c59d82725c9fb921d504e9078d553c862
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
