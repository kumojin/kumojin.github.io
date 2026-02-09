FROM ruby:3.4.8@sha256:a02a5f7b2412b75ac6ad4f14b253a33d59626b110b3e3d151cf6b1ddf86bb2cc
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
