FROM ruby:3.3.5@sha256:bceec7582aaa80630bb51a04e2df3af658e64c0640c174371776928ad3bd57b4
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
