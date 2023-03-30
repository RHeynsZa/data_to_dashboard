# Data to Dashboard

## Introduction

This is a repo used in a presentation on how to get data from a database into a Grafana dashboard.

## Breakdown

The basic parts of the project is:
    - Postgres database - This is where the data will be stored, dockerized
    - Grafana - This is where the dashboard will be created, dockerized
    - Sqitch - This is the tool that will be used to manage the database migrations
    - Docker Composer - This is the tool that will be used to manage the docker containers
## Parts

There are a few parts to this repo:

* `compose.yaml` - This is the docker compose file that will start the database and Grafana
* `sqitch.conf` - This is the sqitch configuration file
* `migrations/` - This is the directory that contains the sqitch migrations
