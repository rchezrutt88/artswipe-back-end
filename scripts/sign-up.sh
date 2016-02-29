#!/bin/bash

curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "z@z.com",
      "password": "z",
      "password_confirmation": "z"
    }
  }'

curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "z@z.com",
      "password": "z",
      "password_confirmation": "z"
    }
  }'
