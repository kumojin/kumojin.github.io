FROM ruby:3.4.4@sha256:642a2c425b964e9b2eeeb359e76bdde98978b5a7aabf774fcb738167a7f2846e
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
