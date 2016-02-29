#!/bin/bash

curl --include --request DELETE http://localhost:3000/sign-out/1 \
  --header "Authorization: Token token=bcb6014f0166b17c6feba2e1fa311976"
