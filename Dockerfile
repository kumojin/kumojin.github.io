FROM ruby:3.3.5@sha256:db263e7c55ec9287780e467834e45273acaa1961bf88225db0c28fe962ee0526
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
