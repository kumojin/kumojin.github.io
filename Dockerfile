FROM ruby:3.4.8@sha256:5ad25607bd0084224ba68927c225c3a56402e3a36181e741a84cab42fb7fc51b
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
