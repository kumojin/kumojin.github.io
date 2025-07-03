FROM ruby:3.4.4@sha256:f7ab76e2c36ab406ebc36aeba20624b26a8fae7c2998acabbe9662e2a73f00f3
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
