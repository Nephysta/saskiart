# Saskiart
[![CircleCI](https://circleci.com/gh/eraleis/saskiart.svg?style=svg&circle-token=c3979111f74408fa7be89b605f797f67553dc872)](https://circleci.com/gh/eraleis/saskiart)

## Prerequisite

Install Docker: https://docs.docker.com/install/

Install Compose: https://docs.docker.com/compose/install/

## Get started

Clone the repository: `git clone git@github.com:eraleis/saskiart.git`

Go to the project folder: `cd saskiart`

Install the dependencies: `bundle install`

## Run in development

Start Postgresql and Redis with: `docker-compose up`

Run the server with: `bin/rails s`

## Tests

Run `bundle exec rspec`
