# README

Application info:

* Ruby version 3.1.2

* Rails version 7.0.4

***

## Steps to set up an application:

0) create `.env` file in root directory, you can find sample of this file in `docker/.env.sample`;

### 1 Classic

1) Make sure that you have a correct ruby version, check `.ruby-version` file to know the ruby version for this project,
   if your version of ruby is different run `rvm use ruby-RUBY_VERSION`, `ruby -v` will show your ruby version;
2) make sure that you have postgresql installed on your machine
3) Run `bundle install` to install gems;
4) setup db `rails db:create db:migrate`
5) Run `rails s`

### 2 Docker + Make (If you have installed make and docker)

1) Run application:
   run `make up` to run and build app
   if you don't have make, you can use regular docker-compose commands
   `docker-compose up --build -d`;
2) Install gems
   `make bundle` or `docker-compose exec app bundle install`;
3) Setup DB
   run `make db-create` `make db-migrate`, or `docker-compose exec app rails db:create db:migrate`;
4) Basic commands: `make attach`, `make bash`, `make c`, `make add-model`
   (full list of available commands you can find in `bin/make` folder);

***

