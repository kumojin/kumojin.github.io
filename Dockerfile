FROM ruby:3.3.6@sha256:3ae98cd2cc44319a92cc7f51fa95dc9dcb2bbb9a15a57b126c21ff43f5f86d11
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
