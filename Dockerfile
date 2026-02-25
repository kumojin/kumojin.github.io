FROM ruby:4.0.1@sha256:3b8c977b1f13501e132a309c903f2f9931e41be4e52785a719490e937953c3de
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
