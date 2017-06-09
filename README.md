[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Recipe-app-api
This is the api for the recipe app I made for my second WDI project. It's a simple
API that adds only a single table to the base template provided. There are some
custom routes setup and a relation between the recipes and users tables.

Overall ruby on rails did most of the work, I was just the overseer. All the magic
was done with really just two migration files. The rest of the magic happens
with the client which is linked below.

## To do

I would like to add more tables - giving me more functionality. The plan would be
a many to many join table between recipes and ingredients as well as a CSV file
to popluate the ingredients table. Perhaps there are some third party APIs I can
employ in the future as well as this may carry over to my capstone project.

After Capsstone:

I have added a new table and new relations. I need to document this information.

For now be aware there is a new table called pictures that needs to be documented.

It has a restful convention and uses recipe_id as a foreign key to associate to its
respective recipe.

## Structure

This template follows the standard project structure in Rails 4.

`curl` command scripts are stored in [`scripts`](scripts) with names that
correspond to API actions.

User authentication is built-in.

## Tasks

Developers should run these often!

-   `bin/rake routes` lists the endpoints available in your API.
-   `bin/rake test` runs automated tests.
-   `bin/rails console` opens a REPL that pre-loads the API.
-   `bin/rails db` opens your database client and loads the correct database.
-   `bin/rails server` starts the API.
-   `scripts/*.sh` run various `curl` commands to test the API. See below.

<!-- TODO -   `rake nag` checks your code style. -->
<!-- TODO -   `rake lint` checks your code for syntax errors. -->

## API

Use this as the basis for your own API documentation. Add a new third-level
heading for your custom entities, and follow the pattern provided for the
built-in user authentication documentation.

Scripts are included in [`scripts`](scripts) to test built-in actions. Add your
own scripts to test your custom API. As an alternative, you can write automated
tests in RSpec to test your API.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```
### Recipes

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/recipes`             | `create`          |
| GET    | `/recipes    `         | `index`           |
| GET    | `/recipes/:id`         | `show`            |
| PATCH  | `/recipes/:id`         | `update`          |
| DELETE | `/recipes/:id`         | `destroy`         |


### Post /recipes

Request:

```sh
curl --include --request POST http://localhost:4741/recipes \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"
  --data '{
    "recipe": {
      "title": "Some recipe",
      "ingredient_list": "some ingredients",
      "directions": "cook it",
      "prep_time": "too long"
    }
  }'
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
Completed 201 Created
Content-Type: application/json; charset=utf-8

{
  "recipe": {
  "directions": "Made it",
  "id": "50",
  "ingredient_list": "Things and stuff",
  "prep_time": "quick",
  "title": "Next recipe"
  }
}
```
### GET /recipes

Request:

```sh
curl --include --request GET http://localhost:4741/recipes\
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
Completed 200 OK
Content-Type: application/json; charset=utf-8

{
  "recipes": {
  "directions": "Made it",
  "id": "50",
  "ingredient_list": "Things and stuff",
  "prep_time": "quick",
  "title": "Next recipe"
  },
  {
  "directions": "Make it make it real good",
  "id": "51",
  "ingredient_list": "Things and stuff",
  "prep_time": "not quick",
  "title": "My recipe"
  }
}
```
### GET /recipe/:id

Request:

```sh
curl --include --request GET http://localhost:4741/recipes/$ID\
  --header "Authorization: Token token=$TOKEN"\
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
Completed 200 OK
Content-Type: application/json; charset=utf-8

{
  "recipes": {
  "directions": "Made it",
  "id": "50",
  "ingredient_list": "Things and stuff",
  "prep_time": "quick",
  "title": "Next recipe"
  }
}
```
### PATCH /recipe/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/recipes/$ID\
  --header "Authorization: Token token=$TOKEN"\
  --data '{
    "recipe": {
      "directions": "cook it, cook it real good"
    }
  }'
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
Completed 200 OK
Content-Type: application/json; charset=utf-8

{
  "recipes": {
  "directions": "cook it, cook it real good",
  "id": "50",
  "ingredient_list": "Things and stuff",
  "prep_time": "quick",
  "title": "Next recipe"
  }
}
```
### DELETE /recipe/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/recipes/$ID\
  --header "Authorization: Token token=$TOKEN"\
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
Completed 200 OK
Content-Type: application/json; charset=utf-8

header empty
```
### Reset Database without dropping

This is not a task developers should run often, but it is sometimes necessary.

**locally**

```sh
bin/rake db:migrate VERSION=0
bin/rake db:migrate db:seed db:examples
```

**heroku**

```sh
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate db:seed db:examples
```

## Production info for api

Production URL:https://recipe-card-backend.herokuapp.com/

Repo:https://github.com/antleo1995/recipe_card_app_api
Ember repo: https://github.com/antleo1995/ember-recipe-app



Back end deployed: https://recipe-card-backend.herokuapp.com/

## Production info for client

Production URL:https://antleo1995.github.io/recipe_card_app/
Ember deployed app: https://antleo1995.github.io/ember-recipe-app/
Front end deployed: https://antleo1995.github.io/ember-recipe-app/
Repo:https://github.com/antleo1995/recipe_card_app

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
