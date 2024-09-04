FROM ruby:3.3.5@sha256:83c6b6ed7a08932f4b41928faa4c653f4842e19242892d20bfc42f0653c0d519
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
