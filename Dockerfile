FROM ruby:3.4.5@sha256:16c69ea506c1ef96474926e3e13fd7444d3964db2f783595a6da9389b8cec301
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
