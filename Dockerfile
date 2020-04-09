FROM ruby:2.7.0

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list


# ENV BUNDLER_VERSION='2.0.2'
# RUN gem install bundler --no-document -v '2.0.2'

RUN apt-get update -qq && apt-get install -y nodejs vim yarn=1.22.4-1 sqlite3 libsqlite3-dev libpq-dev postgresql-client-11

# Remove default bundler and install desired one
RUN gem update --system  && \
    rm /usr/local/lib/ruby/gems/*/specifications/default/bundler-*.gemspec && \
    gem uninstall bundler && \
    gem install bundler -v '2.0.2'

RUN gem install rails -v 6.0.2.2

ENTRYPOINT [ "/bin/bash" ]
