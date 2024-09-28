FROM ruby:3.3.5@sha256:4d9cc15cf3d1c26bed115437ff93cbf7859b3ed782ffd785118fbb80523dc4b6
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
