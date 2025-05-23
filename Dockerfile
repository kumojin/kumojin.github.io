FROM ruby:3.4.4@sha256:4cf7641c6354e8f407afd2dbb0ab1968cd44ac443bd833c16bdf55cc074a3eb8
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
