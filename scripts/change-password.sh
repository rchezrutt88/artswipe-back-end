#!/bin/bash

curl --include --request PATCH http://localhost:3000/change-password/$ID \
  --header "Authorization: Token token=8848d996d319c569f437864570199165" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "x",
      "new": "z"
    }
  }'
