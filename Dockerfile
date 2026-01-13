FROM ruby:3.4.8@sha256:91924d709526afa44f679ee79c881041b7c73bbdbca0da6112328a670307dbb7
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
