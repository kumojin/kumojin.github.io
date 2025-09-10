FROM ruby:3.4.5@sha256:e123d12ea6b48f4db8ebd95078a2fbe94613eb4ec204b7cb8332dd77aaa01cad
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 4000

# Start the main process.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
