# Open GAS
### The open source software for sports associations

The software is still a work in progress. Expect huge variations.

## Develop

I suggest you to use [asdf](https://asdf-vm.com/)
Install ruby 3.3.4

Create the database and seeds:

```
bundle exec rails db:create db:migrate db:seed
```

To run the server:

```
bundle exec rails s
```

You an reach the app at https://localhost:3000

## Tests

Run:

```
bundle exec rails test
```

## Lint

We use [rubocop](https://github.com/rubocop/rubocop) and [htmlbeautifier](https://github.com/threedaymonk/htmlbeautifier) to lint

Run:

```
bundle exec rubocop
bundle exec htmlbeautifier filename
```