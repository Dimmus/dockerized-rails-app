FROM ruby:2.5 as base

RUN apt-get update -qq \
    &&  apt-get install -y nano build-essential libpq-dev nodejs postgresql-client \
    && gem install bundler \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /noteapp

# ADD Gemfile /noteapp/Gemfile
# ADD Gemfile.lock /noteapp/Gemfile.lock
COPY Gemfile Gemfile.lock /noteapp/

WORKDIR /noteapp

RUN bundle install

COPY . /noteapp

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]