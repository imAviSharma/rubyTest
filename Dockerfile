FROM ruby:2.6.3

SHELL ["/bin/bash", "-c"]

EXPOSE 3000

RUN apt-get update && apt-get install -y apt-utils  

RUN apt-get install -y nodejs

RUN mkdir /rails-app

WORKDIR /rails-app

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN gem install bundler

RUN bundle install 

COPY . /rails-app

RUN gem install bundler

RUN bundle install

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

# FROM ruby:2.6.3

# RUN apt-get update -qq \
# && apt-get install -y nodejs

# WORKDIR /workDir

# COPY . /workDir

# RUN gem install bundler -v 2.3.25

# RUN bundle install

# EXPOSE 3000

# CMD ["bundle","exec","rails", "server", "-b", "0.0.0.0"]