[![Build Status](https://travis-ci.org/netguru-training/team-ontario.svg?branch=master)](https://travis-ci.org/netguru-training/team-ontario)

[![Heroku](https://heroku-badge.herokuapp.com/?app=lit-crag-4267)](http://lit-crag-4267.herokuapp.com/)

# Team Ontario (Katowice 2015 workshops)

description here & screenshot

#### :information_source: Crew
- [Juliusz Nadbereżny](https://github.com/nadberezny)
- [Grzegorz Bukała](https://github.com/Walter87)
- [Magda Wiśniewska](https://github.com/mejcz)
- [Tomasz Jaśkiewicz](https://github.com/tomajask)

### :sparkles: Stack

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.2.0 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 4.2.1 |
| [PostgreSQL](http://www.postgresql.org/) | 9.4.4 |

## :hammer: Setup

- clone the app
- `cp config.database.yml database.yml`
- `bundle install`
- `createuser -s postgres`
- `rake db:create db:migrate db:seed`
- `rails server`
- ...
