FROM ruby:2.7.2-slim

ENV APP_HOME /home/dell/Documents/pets/absWeather

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev libxml2-dev libxslt1-dev curl gnupg2 apt-transport-https --no-install-recommends

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  	&& apt-get update && apt-get install --no-install-recommends -y yarn

WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/

RUN bundle check || (bundle install --jobs 20 --retry 5)
    # \
    # && rm -rf /usr/local/bundle/cache/*.gem \
    # && find /usr/local/bundle/gems/ -name "*.c" -delete \
    # && find /usr/local/bundle/gems/ -name "*.o" -delete)

COPY . $APP_HOME
