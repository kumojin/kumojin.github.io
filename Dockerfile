FROM ruby:3.4.8@sha256:4ac284f23753a72ba9fa3d4b3ae27576e301c6250cebecae18d3b65ebfee2579
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
