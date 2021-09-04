# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 3.0.1
* Rails version : 6.1.4

* Database creation
rake db:create
rake db:migrate
rake db:seed # To Add User

* Login
- pass "users/1" in url ex: localhost:3000/users/1, where 1 is id
- Any User will be logged in for a hour and will change if another id passed
- pass "users/2" or pass "users/3" for customers,

* Services (job queues, cache servers, search engines, etc.)
- CronJob

