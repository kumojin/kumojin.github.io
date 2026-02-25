FROM ruby:3.4.8@sha256:998b24b17d0e8ac2a9974c11052cba9bb46f8ba519169969492181f262d27a58
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
