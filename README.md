# NY Times Feeder

## Description

Reader for NY Times RSS feeds.

## Specifications

 * Ruby version

   ```
      >= 2.2.1
   ```

 * System dependencies:

   ```
      postgresql >= 9.3
   ```

 * Database creation

   ```
      bin/rake db:create:all
   ```

 * Database initialization

   ```
      bin/rake db:migrate
   ```

 * Database setup

   ```
      bin/rake db:seed
   ```


 * How to run the test suite

   ```
      bin/rspec
   ```


 * How to run the server locally

   ```
      bin/rails s
   ```

   ```
      open http://localhost:3000
   ```

 * How to run worker processes & scheduler

   Launch redis server:
   ```
      redis-server
   ```

   Launch resque-pool for concurrency:
   ```
      env TERM_CHILD=1 VVERBOSE=1 WORKER_CONCURRENCY=2 bundle exec resque-pool --environment development
   ```

   Launch resque scheuler for scheduled jobs:
   ```
      rake resque:scheduler
   ```
