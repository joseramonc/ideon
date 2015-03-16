# Getting the token

This requests are unauthenticated

### Create user

    curl -X POST -H "Content-Type: application/json" -d '{"user":{"email":"plata@mail.com","password":"12345678"}}' http://localhost:3000/api/user

  response:

    {"user":{"id":3,"email":"plata@mail.com","auth_token":"dc45800fddee07cf9b300d2765283cb2"}}


### Get Token:
    curl -X POST http://104.131.189.224/api/token --data "email=joserracamacho@gmail.com&password=12345678"

reponse:

    {"user":{"auth_token":"26157f9b236b9bc23ccfed01200fb725"}
