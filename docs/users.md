# Users
## Attributes:
* email (string) *required*
* password (string) *required*

All requests are authenticated


## Update User
  Is going to update the user with the authorization token supplied.

    curl -X PUT -H "Authorization: dc45800fddee07cf9b300d2765283cb2" -H "Content-Type: application/json" -d '{"user":{"email":"plata@google.com","password":"asdfasdf"}}' http://localhost:3000/api/user

  response:

    {"user":{"id":3,"email":"plata@google.com","auth_token":"dc45800fddee07cf9b300d2765283cb2"}}

## Delete User

    curl -X DELETE -H "Authorization: dc45800fddee07cf9b300d2765283cb2" http://localhost:3000/api/user

  response:

    OK
