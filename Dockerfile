FROM ruby:3.4.7@sha256:b2dcadfcbaf93fceaf321b70c41a587ff535c2b10c22f8a25b401f21772670ba
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
