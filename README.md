Currently server is running at: (http://104.131.189.224)[http://104.131.189.224]

### API usage

## get token:
    curl -X POST http://104.131.189.224/api/token --data "email=joserracamacho@gmail.com&password=12345678"

#### reponse:
    {"user":{"auth_token":"26157f9b236b9bc23ccfed01200fb725"}

## authenticated requests

### List all notes

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" http://104.131.189.224/api/notes

#### response:

    {"notes":[{"id":1,"title":"123","body":"123","favorite":true,"status":true},{"id":2,"title":"hola","body":"big body","favorite":true,"status":false},{"id":3,"title":"hola","body":"big body","favorite":true,"status":false},{"id":4,"title":"hello notes","body":"example body","favorite":false,"status":true}]}


### Create a Note

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" -X POST http://104.131.189.224/api/notes --data "note[title]=hola&note[body]=big body&note[favorite]=1&note[status]=0"

#### response:
    {"note":{"id":2,"title":"hola","body":"big body","favorite":true,"status":false}}


### Get a single note

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" -X POST http://104.131.189.224/api/notes --data "note[title]=hola&note[body]=big body&note[favorite]=1&note[status]=0"

#### response:

    {"note":{"id":3,"title":"hola","body":"big body","favorite":true,"status":false}}


### Updating a note (id=1)

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" http://104.131.189.224/api/notes/1 -X PUT --data "note[title]=hello notes&note[body]=update body&note[favorite]=0&note[status]=1"

#### response:

    {"note":{"id":1,"title":"hello notes","body":"update body","favorite":false,"status":true}}

### Deleting a note (id=2)

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" http://104.131.189.224/api/notes/2 -X DELETE

#### response

    ''
