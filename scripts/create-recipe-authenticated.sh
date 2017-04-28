#!/bin/bash

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

  curl --include --request POST http://localhost:4741/recipes \
    --header "Content-Type: application/json" \
    --header "Authorization: Token token=BAhJIiU3M2QyMjU2NjcwZDI2NzQ2MDI5YjgyOWQ1Mzc2MDNiMgY6BkVG--e9e833a4d014166a3d9f20d9f3570a5dbe94b56b" \
    --data '{
      "recipe": {
        "title": "Some new recipe",
        "ingredient_list": "some ingredients to test",
        "directions": "cook it, cook it real good",
        "prep_time": "too long, for april"
      }
    }'
echo
