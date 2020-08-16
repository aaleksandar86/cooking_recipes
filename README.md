# Cooking Recipes

This project is made with ruby on rails, with ruby version 2.6.6 and rails version 6.0.3.2.
The purpose of this project is to learn and practice web development skills with ruby and ruby on rails along with front end styling.
This project is not made for commercial use.
#### Project features:
  - Creating users with users sign-up form
  - Users can create, edit and delete their own recipes and can view other users' recipes.
  - Recipes consist of a title, description, ingredients and instructions.
  - The ingredients and the instructions are separate in model sence and are created using nested forms.

#### Project Installation

Installation is performed in four steps:

1. Clone the project from Git
2. Build Dependencies
3. Set Up Database
4. Start the Server
#### Clone project from Github

```sh
$ git clone https://github.com/aaleksandar86/cooking_recipes.git
$ cd cooking_recipes
```
#### Build Dependencies
Install or change to ruby version 2.6.6. To install ruby you can visit this [guide](https://www.ruby-lang.org/en/documentation/installation/).
You also need to have rails installed on your system.
```sh
$ gem install rails
```

Then:
```sh
$ gem install bundler
$ bundle install
```
#### Set Up Database

This project uses [SQLite](https://www.sqlite.org/index.html).

Set up database with the seed file (this will populate the database with some data to try how it works):
```sh
$ rails db:seed
```
#### Start the  Server

```sh
$ rails server
```

Now visit [http://localhost:3000](http://localhost:3000)
