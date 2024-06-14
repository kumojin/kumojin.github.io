FROM ruby:3.3.3@sha256:264cdcb261f9edb5687732d9cca8198130ed0688b4dcd1ef99640d7ecd8ef702
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
