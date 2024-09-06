FROM ruby:3.3.5@sha256:9ee601015fbb7c610ae02137d5698ab712f821069eaf7c0548e58a5b609970aa
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
