FROM ruby:4.0.1@sha256:299b7872d1d2f9e73666ef82ea1d759f1976a8bd16367e8637e3665ff94e942d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
