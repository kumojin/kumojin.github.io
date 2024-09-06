FROM ruby:3.3.5@sha256:e87fc97f3a9eaa0f46d5f71710b97037f6b617e11d531b3fd1846ac13da5521d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
