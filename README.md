# CNAB import

## Setup the project

```sh
bundle install
```

## Setup the database (SQLITE3)

```sh
rails db:create && rails db:migrate && rails db:seed
```

## Run the project

```sh
rails server
```

## Testing

```sh
rspec
# or
bundle exec rspec
```