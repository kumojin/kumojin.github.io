FROM ruby:3.4.2@sha256:dadc48c65638f936d5f113d05cb79bc09a42099b51e7744afc42cd8da4f266d8
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
