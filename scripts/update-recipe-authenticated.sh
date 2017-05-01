#!/bin/bash

  curl --include --request PATCH http://localhost:4741/recipes/14 \
    --header "Content-Type: application/json" \
    --header "Authorization: Token token=BAhJIiU2YmNhNDYyYzMzYzg2ZDUxZmEzZWE1ODA4M2YxMDdmYgY6BkVG--842c3900fb3347e257651d2f3a7b0ef0ef07d9a7" \
    --data '{
      "recipe": {
        "directions": "cook it, cook it real good"
      }
    }'
echo
