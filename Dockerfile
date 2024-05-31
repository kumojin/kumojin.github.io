FROM ruby:3.3.2@sha256:2e65a8296383aee6ebce075fe3e0915d556d73794efdc985fc38193608801002
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
