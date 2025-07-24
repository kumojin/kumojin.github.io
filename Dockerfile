FROM ruby:3.4.5@sha256:503a6fdc6eb983ed903b814661ee0bf20585e15262bc500480cc3155cf91e67c
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
