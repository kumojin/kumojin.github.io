FROM ruby:3.3.4@sha256:d4233f4242ea25346f157709bb8417c615e7478468e2699c8e86a4e1f0156de8
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
