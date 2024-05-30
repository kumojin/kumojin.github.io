FROM ruby:3.3.1@sha256:797d68561a91415e05fd95178f467d86d77bce2d4f17f32683241a687cbd1705
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
