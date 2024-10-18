FROM ruby:3.3.5@sha256:bd263fcf42b1d2850b2bae730e88109fc6ecc43aa081f029d3796c411554be2d
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
