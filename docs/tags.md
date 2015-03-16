# Tags
## Attributes
* title (string)

All requests are authenticated

  ### List all tags

    curl -X GET -H "Authorization: dc45800fddee07cf9b300d2765283cb2" http://104.131.189.224/api/tags

  response:

    {"tags":[{"id":3,"title":"etiquetaaa actualizadaaa"},{"id":4,"title":"spaaam"}]}

  ### Create Tag
    curl -X POST -H "Authorization: dc45800fddee07cf9b300d2765283cb2" -H "Content-Type: application/json" -d '{"tag":{"name":"etiquetaaa"}}' http://104.131.189.224/api/tags

  response:

    {"tag":{"id":3,"title":"etiquetaaa"}}

  ### Update tag (id=3)

    curl -X PUT -H "Authorization: dc45800fddee07cf9b300d2765283cb2" -H "Content-Type: application/json" -d '{"tag":{"name":"etiquetaaa actualizadaaa"}}' http://104.131.189.224/api/tags/3

  response:

    {"tag":{"id":3,"title":"etiquetaaa actualizadaaa"}}


  ### Delete tag(id=4)

    curl -X DELETE -H "Authorization: dc45800fddee07cf9b300d2765283cb2" http://104.131.189.224/api/tags/4

  response:

    OK
