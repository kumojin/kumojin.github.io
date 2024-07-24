FROM ruby:3.3.4@sha256:60e7c0e5f8d878675a3838a2919eb52e707b7a867c653e3767d67be75f250e22
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
