FROM ruby:3.1.1-alpine3.15

# Update the installer
RUN apk update -qq && apk upgrade

# Install Deps
# TODO: pg 
# postgresql-dev \
# postgresql-client \
RUN apk add --no-cache \
	 # Necesssary
	 build-base \
	 sqlite sqlite-dev \
	 nodejs yarn tzdata \
	 vim bash

RUN gem install bundler --version '~> 2.2.31'

# Create that directory in the base image
WORKDIR /usr/src/app

# Copy gemfile before 
COPY Gemfile* ./
RUN bundle install

# Copy all files then yarn 
COPY . .
RUN yarn install --check-files

# App
EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
