# Notes
## Attributes:
* name (string)
* body (string)
* favorite (boolean)

All requests are authenticated

### List all notes (of authorized user)

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" http://104.131.189.224/api/notes

response:

    {"notes":[{"id":1,"title":"123","body":"123","favorite":true,"status":true},{"id":2,"title":"hola","body":"big body","favorite":true,"status":false},{"id":3,"title":"hola","body":"big body","favorite":true,"status":false},{"id":4,"title":"hello notes","body":"example body","favorite":false,"status":true}]}


### Create a Note
  You may send an attribute `tag_ids` as an array of tags to associate it with those tags

    curl -X POST -H "Authorization: 68f582de1c5439ae3a0a4f6a050822ac" -H "Content-Type: application/json" -d '{"note":{"title":"nueva nota","body":"esta es la super nota", "tag_ids":[3,4]}}' http://104.131.189.224/api/notes

  response:

    {"note":{"id":9,"title":"nueva nota","body": "esta es la super nota","favorite":false,"status":null,"tags":[{"id":3,"title":"et2"},{"id":4,"title":"et1"}]}}


### Get a single note

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" -X POST http://104.131.189.224/api/notes --data "note[title]=hola&note[body]=big body&note[favorite]=1&note[status]=0"

response:

    {"note":{"id":3,"title":"hola","body":"big body","favorite":true,"status":false}}


### Updating a note (id=1)
  As with create action, an option tag_ids may be supplied

    curl -X PUT -H "Authorization: dc45800fddee07cf9b300d2765283cb2" -H "Content-Type: application/json" -d '{"note":{"title":"actualizar etiquetas","body":"etiquetaaas actualizadaaas", "tag_ids":[3,4]}}' http://104.131.189.224/api/notes/8

response:

    {"note":{"id":8,"title":"actualizar etiquetas","body":"etiquetaaas actualizadaaas","favorite":null,"status":null,"tags":[{"id":3,"title":"etiquetaaa actualizadaaa"},{"id":4,"title":"spaaam"}]}}

### Deleting a note (id=2)

    curl -H "Authorization: 26157f9b236b9bc23ccfed01200fb725" http://104.131.189.224/api/notes/2 -X DELETE

response

    OK
