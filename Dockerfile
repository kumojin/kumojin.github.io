FROM ruby:3.4.5@sha256:73e085e58f9496502b0463a787b497b961d946bc1db43c6782c0c3c95281e432
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
