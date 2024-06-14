FROM ruby:3.3.3@sha256:8472161cb4d1335ba8de4503354c2e523701dd1c1d8567402e1de9c03db65287
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
