# Grandma's Neon Farmhouse

#### By Aaron Boyd, Deya Card, Rian Carter, Cameron Johnson & Greg Khmara

This application is an example website for a hypothetical restaurant. This was a collaborative effort for a "Team Week" project to emphasize our ability to work together. 

## Technologies used:

* Ruby 
* Rails 
* RSPEC
* Capybara
* shoulda-matchers
* Pry
* markdown
* Postgres
* SQL
* Devise
* CSS 


## Description:
This application uses Ruby on Rails and Postgres to demonstrate a one-to-many association from the User model to the Order model, and a one-to-many association from the Order model to the Item model. It also uses Routes, Models and Controllers to add CRUD functionality.

A User is able to create an account by Signing Up through the Login form. Once they have created a User object(account) they can initialize an Order. The Order object will start with the attribute :user_id set to the current user's id and the :total_cost attribute set to null. From there, a user can add Items to the order. Items will all have the attribute :dish, which is the type of dish. Depending on the type of dish, the user will be able to add attributes such as :size, :toppings, :drink_type or which :app_side they want. All of those attribute choices will effect the :cost of the Item object. After the items have been created and added to the Order, the order will be updated and have a :total_cost attribute that is the sum of all the items that belong to the order.

## Setup/Installation Requirements

* To run this program, you must have Ruby 2.6.5 and Rails 5.2.0 installed on your machine. If you do not, you can follow these instructions: [Mac](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-ruby-on-mac) or [PC](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-ruby-on-windows).

* Clone this file to your local machine using this projects' [github](https://github.com/AaronDBoyd/Grandmas_Neon_Farmhouse)
* Once you have the project downloaded, navigate to the root of the project in your terminal and type "bundle install".
* You will also need Postgres installed on your machine. If you do not, you can follow these [instructions.](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-postgres).
* In the terminal at the root of the project, type "postgres" to make sure Postgres is running.
* NOTE: if you are running this application on a Windows machine you will have to adjust the database access settings. To do so, go to the file located at `config/database.yml` and add you username and password specifications to sections `development:`, `test:`, and `production:` like so:
```
development:
  <<: *default
database: Grandmas_neon_farmhouse_development
username: <%= ENV['POSTGRES_USERNAME'] %> 
password: <%= ENV['POSTGRES_PASSWORD'] %> 
```

* Then, in a separate terminal type:
* `rake db:create` - this will create a new database.
* `rake db:migrate` - this will upload the schema design to the database.
* `rake db:test:prepare` - this will design the test database to mirror the development database.
* `rake db:seed` - this with auto-populate the database.
* `rails s` - this will run the rails server so the project can be viewed in the browser.(keep this terminal separate from your working terminal.)
* In a browser, visit `localhost:3000` to view the webpage.

## Using Webpage

Users that are not signed in will only be only to see the Home page, which is the Restaurant's menu, and the About page.

Users that create an accout and sign in will be able to Create an order and add items to that order. They will also be able to see all of their orders. They can also edit or delete their Orders and the Items that belong to those Orders.

A User that is also an Admin will be able to view all orders that have been placed. 

## Known Bugs

* No known bugs.
* If you notice any mistakes or bugs, please send an email to either a.boyd91@yahoo.com, thedeyacard@gmail.com, r.carter86@hotmail.com, cameron_johnson91@icloud.com or gkhmara@gmail.com

## License

[MIT](https://opensource.org/licenses/MIT)
Copyright 2022 (c) Aaron Boyd, Deya Card, Rian Carter, Cameron Johnson & Greg Khmara
