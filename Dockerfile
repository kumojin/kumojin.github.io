FROM ruby:3.3.5@sha256:16e15a93b1f3d20c253848c85bfde89c0927780c534b7531907b949c2151e3a1
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
