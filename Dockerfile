ARG RUBY_VERSION=2.5
FROM ruby:$RUBY_VERSION as base

RUN apt-get update -qq \
    &&  apt-get install -y nano build-essential libpq-dev nodejs postgresql-client \
    && gem install bundler \
    && rm -rf /var/lib/apt/lists/*


ENV WORK_DIR=/noteapp
RUN mkdir $WORK_DIR
COPY Gemfile Gemfile.lock $WORK_DIR/
WORKDIR $WORK_DIR
RUN bundle install
COPY . $WORK_DIR

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

FROM base as dev

ENV RAILS_ENV=development
EXPOSE 3000
CMD [ "rails", "server", "-b", "0.0.0.0" ]

FROM base as prod

ENV RAILS_ENV=production
RUN RAILS_ENV=production bundle exec rake assets:precompile
RUN rm -rf tmp/* log/* app/assets vendor/assets lib/assets test 
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-Cconfig/puma.rb"]

