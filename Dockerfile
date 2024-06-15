FROM ruby:3.3.3@sha256:8584c968202ea356984262c4422461ee3a6022c0c4d8fb517b7b9c6395556670
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
