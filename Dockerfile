FROM ruby:3.4.8@sha256:95b22f0745feddf4f3e749840c2b41b568efa30234d6eca4537c1dd042850415
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
