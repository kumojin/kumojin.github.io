FROM ruby:3.4.5@sha256:b15ed5b3ba183b086f01ff043dfa2745c5282ad9c045c38caaf3f385d929afa4
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
