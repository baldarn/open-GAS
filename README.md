[![ci](https://github.com/baldarn/open-GAS/actions/workflows/ci.yml/badge.svg)](https://github.com/baldarn/open-GAS/actions/workflows/ci.yml)
[![Code Climate](https://codeclimate.com/github/baldarn/open-GAS/badges/gpa.svg)](https://codeclimate.com/github/baldarn/open-GAS)

# Open GAS
### The open source software for sports associations

The software is still a work in progress. Expect huge variations.

## Develop

I suggest you to use [asdf](https://asdf-vm.com/)
Install ruby 3.3.4

Start the needed services with docker compose:

```
docker compose up -d
```

Create the database and seeds:

```
bin/rails db:create db:migrate db:seed
```

To run the server:

```
bin/rails s
```

You an reach the app at https://localhost:3000

## Tests

Run:

```
# application tests
bin/rails test

# system tests (E2E)
bin/rails test:system

# all
bin/rails test:all
```

## Lint

We use [rubocop](https://github.com/rubocop/rubocop) and [htmlbeautifier](https://github.com/threedaymonk/htmlbeautifier) to lint

Run:

```
bundle exec rubocop
bundle exec htmlbeautifier filename
```

## Deploy

We use [kamal](https://github.com/basecamp/kamal) for deploying.

Copy the `.env` file:

```
cp .env.example .env
```

Configure your env variables.

The first time (after having configured you server), run:

```
bundle exec kamal setup
```

For pushing envs or changing those, run:

```
bundle exec kamal env push
```

Then:

```
bundle exec kamal deploy
```
