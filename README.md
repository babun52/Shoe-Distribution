# _Shoe Distribution_

#### _A program to track shoe brands and what stores they are in, December 16th, 2016_

#### By _**James Lee**_

## Description

The user stories:

  * As a user, I want to be able to add, update, delete and list shoe stores.
  * As a user, I want to be able to add and list new shoe brands.
  * As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
  * As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
  * As a user, I want to be able to associate the same brand of shoes with multiple stores.
  * As a user, I want to be able to see all of the brands a store sells on the individual store page.
  * As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
  * As a user, I do not want stores and shoes to be saved if I enter a blank name.


## Setup/Installation Requirements

```
$ git clone https://github.com/babun52/Shoe-Distribution.git
```

Install required gems:
```
$ bundle install
```
Create databases:
```
rake db:create
rake db:schema:load
```
Start the webserver:
```
$ ruby app.rb
```

Navigate to ```localhost:4567``` in browser.


## Known Bugs


## Support and contact details

* Github: https://github.com/babun52
* Email: babun5209@gmail.com

## Technologies Used

Application: Ruby, Sinatra, Active Record<br>
Testing: Rspec, Capybara<br>
Database: Postgres

### License

GNU GPL v2. Copyright (c) 2016 **_James Lee_**
