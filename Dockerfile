FROM ruby:3.4.8@sha256:be45f7e91661b88215e731879efa9e7cfeedf4d0f1bac1eb13d320604f624a2b
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
