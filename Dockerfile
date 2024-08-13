FROM ruby:3.3.4@sha256:748bb597c009956ae0dfd20ad6378347fa579b0622b7f55a972736cc43f29b23
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
