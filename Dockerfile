FROM ruby:3.4.4@sha256:a8c8632d11c93a1803530690f37a4f881c4c466f45e420b8e59a341c151c33cc
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
