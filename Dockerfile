FROM ruby:3.4.4@sha256:b92f553dd84fe32a5b9db7035d82930e3045828846595310219815c2abeb42d4
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
