FROM ruby:3.3.4@sha256:66f846540dd76411ce9a9a51657d93bb51abb7c890bc5e88d1e6eb1c5acc7921
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
