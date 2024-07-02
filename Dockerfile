FROM ruby:3.3.3@sha256:ff42dab427ec98c9c0a2139ca8843e16a7c48b4d063c8afffa6fe36f1ab643e0
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
