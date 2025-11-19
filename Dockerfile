FROM ruby:3.4.7@sha256:6a1290331f4f9c5955515bb0135de54b45faccb3772b81b58d2b7bb450d759e7
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
