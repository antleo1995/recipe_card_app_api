#!/bin/bash

curl --include --request POST http://localhost:4741/recipes \
  --header "Content-Type: application/json" \
  --data '{
    "recipe": {
      "title": "Some recipe",
      "ingredient_list": "some ingredients",
      "directions": "cook it",
      "prep_time": "too long"
    }
  }'

echo
