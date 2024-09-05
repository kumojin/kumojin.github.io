FROM ruby:3.3.5@sha256:2a57e5c868eac461dce2d1302dc57e00c94f335712856867c5038b589654de72
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
