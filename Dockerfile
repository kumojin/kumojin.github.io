FROM ruby:3.4.6@sha256:1b282c003e9f5fd583aa3695692a4a8a4c4a51aec0ef95b009e9ca949f6f1662
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
