FROM ruby:2.6.3
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client
WORKDIR /workDir
COPY . /workDir
RUN gem install bundler -v 2.3.25
RUN bundle install
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
