FROM ruby:2.5

# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /railsTest

WORKDIR /railsTest

COPY Gemfile /railsTest/Gemfile
COPY Gemfile.lock /railsTest/Gemfile.lock

RUN bundle install
# COPY . /railsTest

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

