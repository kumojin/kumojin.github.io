FROM ruby:3.3.3@sha256:543886cca6a12761a27a3d2da392a36b0771e2503dc98149e08a9af72af95b3a
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
