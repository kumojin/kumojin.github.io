FROM ruby:3.4.7@sha256:b73412df64113f6d8561ae2b5e04e4e97d1b88e38fb03fa0863e63506ed05b26
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
