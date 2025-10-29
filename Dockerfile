FROM ruby:3.4.7@sha256:85792c7c1adcb5c304ae668d0482f7213f22794ddd8a7df1f5a92da002eee662
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
