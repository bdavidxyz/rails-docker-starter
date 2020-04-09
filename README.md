# Rails on Docker starter

This repository is intended to be used as a "starter".

 -> You want to use Docker to avoid critical mental workload
 -> You want every possible software to have a well-defined version, to avoid bad, weird, time-consuming surprises.
 -> You need a starter more than a fully-configured Rails+Docker application


It has only one service in the docker-compose file : the dev machine.


You will probably add services in the like databases, webpacker or reverse-proxy.

But every project is different, so right now

## Prerequisite

This was tested with docker version 17.12.0-ce, and docker-compose version 1.18.0.
Any further version should be fine.

## Installation

```
~/workspace/myapp$ docker-compose build
~/workspace/myapp$ docker-compose run --rm --service-ports ruby_dev 
```
## Rails app creation

Now you are inside docker container
```
root@903def370acf:/dockerdir# rails new myapp && cd myapp
root@903def370acf:/dockerdir/myapp# bundle install # mandatory
root@903def370acf:/dockerdir/myapp# bundle exec rake webpacker:install # optionnal
```
## Launch Rails
```
root@903def370acf:/dockerdir# bundle exec rails server -p $PORT -b 0.0.0.0
```
