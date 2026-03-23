FROM ruby:4.0.2@sha256:d0996dba0e549565279d666a436053d6489bce8df19d2b1024e7de559c6b079d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
