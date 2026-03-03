FROM ruby:3.3-slim

LABEL Name=dockerfilesamples Version=0.0.2

EXPOSE 8080

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config set frozen true

WORKDIR /app

# Copy Gemfile first for better layer caching
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

CMD ["ruby", "dockerfilesamples.rb"]
