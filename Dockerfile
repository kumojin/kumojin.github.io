FROM ruby:3.4.8@sha256:ee8d45137f70f47213ae33998cf79bd7cb7209291a912632f039c81ab28ae7fb
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
