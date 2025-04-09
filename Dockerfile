FROM ruby:3.4.2@sha256:a4b78df1f33335b595524a16773e58bbb2ee08a8dc9d870cfbad15a6d286d0f6
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
