# README

## Demo project: Flower Shop

### Description:

A flower shop used to base the price of their flowers on an item by item cost. So if a
customer ordered 10 roses then they would be charged 10x the cost of single rose. The
flower shop has decided to start selling their flowers in bundles and charging the customer
on a per bundle basis. So if the shop sold roses in bundles of 5 and 10 and a customer
ordered 15 they would get a bundle of 10 and a bundle of 5.

The flower shop currently sells the following products:

```
Name   Code Bundle
Roses  R12  5 @ $6.99
           10 @ $12.99
Lilies L09  3 @ $9.95
            6 @ $16.95
            9 @ $24.95
Tulips T58  3 @ $5.95
            5 @ $9.95
            9 @ $16.99
```

### Task:

Given a customer order you are required to determine the cost and bundle breakdown for
each product. To save on shipping space each order should contain the minimal number
of bundles.

### Input:

Each order has a series of lines with each line containing the number of items followed by
the product code
An example input:
```
10 R12
15 L09
13 T58
```

### Output:

```
10 R12 $12.99
1 x 10 $12.99
15 L09 $41.90
1 x 9 $24.95
1 x 6 $16.95
13 T58 $25.85
2 x 5 $9.95
1 x 3 $5.95
```

## To get project running

* Ruby version: ruby-2.4.1

    bundle install

* Database: PostgreSQL

* Create Database with postgres for the project:

  In development 

      CREATE USER dev WITH PASSWORD 'password’;

      CREATE DATABASE flower_shop_development OWNER dev;

  In production

      CREATE USER production WITH PASSWORD 'password’;

      CREATE DATABASE flower_shop_production OWNER production;

* Database migration and seed

  In development

      bundle exec rake db:migrate

      bundle exec rake db:seed

  In production

      bundle exec rake db:migrate RAILS_ENV=production

      bundle exec rake db:seed RAILS_ENV=production

      bundle exec rake assets:precompile RAILS_ENV=production (pre-compile in prod)

* Run it

  In development

      rails s

  In production, need to generate a secret key by

      RAILS_ENV=production rake secret

      export SECRET_KEY_BASE=secret_key

      RAILS_ENV=production bundle exec rails s

