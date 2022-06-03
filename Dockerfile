FROM ruby:2.5.8-stretch

WORKDIR /opt/app
COPY ruby_app .
RUN gem install bundler -v 2.2.33
RUN bundle install
COPY .env .

CMD ["bundle", "exec", "sidekiq"]