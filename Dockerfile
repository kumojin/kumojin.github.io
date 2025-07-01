FROM ruby:3.4.4@sha256:94ade57fa574e94c09eb2110afb00d60b52b050522ef4e805ca80f2402fc723c
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
