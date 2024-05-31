FROM ruby:3.3.2@sha256:a67dcbc840ad773775c250f0caef2554a0c6f487289c6b113e1fa4aa1e175887
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
