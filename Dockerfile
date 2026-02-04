FROM ruby:3.4.8@sha256:90c7400d25f07962309fca2aa26b94bf1835e5bb7b30c7270e72463016f05f87
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
