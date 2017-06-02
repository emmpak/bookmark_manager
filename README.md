# Bookmark Manager Project

During week 4, we were given the task to build a bookmark manager. The main functionalities include:

* saving a webpage
* adding tags to the webpages so that you can find them later
* browse links other users have added

### Learning Objectives

The main topic of this week was **databases**. Some new concepts that I learned:

* Object-relational mappers
* Relationships between data in a database
* SQL, the database query language
* Data encryption
* Rake
* Web app deployment


Some of the skills that I focused on:

* Designing data relationships using an object-relational mapper
* Designing a database schema
* Manipulating data using the CRUD cycle
* Structuring more complex MVC applications
* Refactoring more complex apps


### Tech

Ruby,
Sinatra,
PostgreSQL,
DataMapper,
BCrypt,
RSpec,
Capybara

### Setup

* Clone repository
* `cd` to the project's root directory
* Run `gem install bundler`
* Run `bundle install` to install all of the required gems
* Create the following databases `bookmark_manager_development` and `bookmark_manager_test`
* Run `rspec` to make sure that all tests are passing
* Run `rackup`
* Visit [localhost:9292/users/new](localhost:9292) in a browser

### User Stories

```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage
```

```
As a time-pressed user
So that I can quickly find web sites I recently bookmarked
I would like to see links in descending chronological order
```

```
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager
```

```
As a time-pressed user
So that I can organise my many links into different categories for ease of search
I would like to add tags to the links in my bookmark manager
```

```
As a time-pressed user
So that I can quickly find links on a particular topic
I would like to filter links by tag
```
