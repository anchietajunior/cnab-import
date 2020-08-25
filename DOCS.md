# CNAB import

## Versions

- Ruby 2.7.1
- Rails 6.0.3.2

## Setup the project

```sh
bundle install
```

## Setup the database (SQLITE3)

```sh
rails db:create && rails db:migrate && rails db:seed
```

or

```sh
rails db:reset
```

## Run the project

```sh
rails server
```

## Testing

```sh
bundle exec rspec
```

## Project Engineering principles

### *A class can be no longer than 100 lines of code.*
If a class has more than 100 lines of code, the possibility for this class to have more than one reason to change is pretty high

### *5 lines per method*

A method can be no longer than 5 lines of code.

The first rule of functions is that they should be small. The second rule of functions is that they should be smaller than that. (Clean Code by Robert Martin)

### *4 parameters per method*

Pass no more than 4 parameters into a method.

Hash options are also parameters Do not fool ourselves with a hash full of parameters.

If there are more than 4 parameters, most of the time we can pull a new object out of some of the parameters.

### *1 object per view*

A view template should only refer to 1 object. 

## Project Design Patterns

- Services
- Parsers

## Project Possible Improvements

- Implement Facade Patten
- Remove n+1 queries