FROM ruby:2.7.4@sha256:c4f29f28d297efcce62455a20d38383155a85eda9de38ed4635c2c5f3017df03
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
