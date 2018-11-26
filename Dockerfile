FROM ruby:2.5.3

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y sqlite3 && rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 5.2.1

RUN gem install rails --version "$RAILS_VERSION"

RUN mkdir -p /app 
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle --version
RUN bundle update
RUN bundle install

COPY . ./

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]