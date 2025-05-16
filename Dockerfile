FROM ruby:3.4.4@sha256:370e6be29a1cecbf44993087d2750e7d9e1570fde5b97c74325063b1750d11d0
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
