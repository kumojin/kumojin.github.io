FROM ruby:3.3.6@sha256:9d4892f485258e6ecb8780f5dee379adc9b0430d69194f21dcc1917a5f1911e9
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
