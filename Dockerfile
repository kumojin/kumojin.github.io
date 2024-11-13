FROM ruby:3.3.6@sha256:5727a4d0cc8d9f2deaa99c0b22bd5bed6b02e8898f701fef4b4e61ebef896ab0
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
