FROM ruby:3.3.5@sha256:cfb6fd5c8d66f212e86e338360ec16162928a0f32e39e1acb385164144f37753
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
