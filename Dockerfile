FROM ruby:2.7.2-slim

USER root

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev libxml2-dev libxslt1-dev curl gnupg2 apt-transport-https --no-install-recommends

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  	&& apt-get update && apt-get install --no-install-recommends -y yarn

ENV APP_USER app
ENV APP_USER_HOME /home/$APP_USER
ENV APP_HOME /home/dell/Documents/pets/absWeather

RUN useradd -m -d $APP_USER_HOME $APP_USER

RUN mkdir /var/www && \
 chown -R $APP_USER:$APP_USER /var/www && \
 chown -R $APP_USER $APP_USER_HOME

WORKDIR $APP_HOME

USER $APP_USER

COPY Gemfile* $APP_HOME/

RUN bundle check || (bundle install --jobs 20 --retry 5)
    # \
    # && rm -rf /usr/local/bundle/cache/*.gem \
    # && find /usr/local/bundle/gems/ -name "*.c" -delete \
    # && find /usr/local/bundle/gems/ -name "*.o" -delete)

COPY . $APP_HOME

USER root

RUN chown -R $APP_USER:$APP_USER "$APP_HOME/."

USER $APP_USER

RUN bin/rails assets:precompile

CMD bundle exec puma -C config/puma.rb
