FROM ruby:3.3-slim

EXPOSE 8080

WORKDIR /app

# Copy Gemfile first for better layer caching
COPY Gemfile Gemfile.lock* ./
RUN bundle install

COPY . .

RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

CMD ["ruby", "dockerfilesamples.rb"]
