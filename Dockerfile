FROM ruby:2.6.3-stretch

COPY . /application

WORKDIR /application

RUN bundle install --deployment --without development test


ENV RAILS_ENV production

# Install gems, nodejs and precompile the assets
RUN bundle install --deployment --without development test \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs

# Start the application server
ENTRYPOINT ['./entrypoint.sh']
