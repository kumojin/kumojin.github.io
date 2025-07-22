FROM ruby:3.4.5@sha256:18aff7793b70a2b8a7b6b9789de9e8fa749742ae989be7a1c2cd54acacf84abe
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
