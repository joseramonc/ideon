# Checklist Items
## Attributes
* description (string)
* checked (boolean) default => false
* note_id (foreign key notes)

All requests are authenticated

  ### List all tags

    curl -H "Authorization: 68f582de1c5439ae3a0a4f6a050822ac" -H "Content-Type: application/json" http://localhost:3000/api/notes/3/checklist_items

  response:
  {"checklist_items":[{"id":1,"description":"eaas","checked":true},{"id":3,"description":"eaas","checked":false}]}

  ### Create checklist item
  
    curl -X POST -H "Authorization: 68f582de1c5439ae3a0a4f6a050822ac" -H "Content-Type: application/json" -d '{"checklist_item":{"description":"eaas"}}' http://localhost:3000/api/notes/3/checklist_items

  response:

    {"checklist_item":{"id":3,"description":"eaas","checked":false}}

  ### Update tag (id=3)

    curl -X PUT -H "Authorization: 68f582de1c5439ae3a0a4f6a050822ac" -H "Content-Type: application/json" -d '{"checklist_item":{"description":"offofofo"}}' http://localhost:3000/api/notes/3/checklist_items/2

  response:

    {"checklist_item":{"id":2,"description":"offofofo","checked":false}}


  ### Delete tag(id=4)

    curl -X DELETE -H "Authorization: 68f582de1c5439ae3a0a4f6a050822ac" -H "Content-Type: application/json" http://localhost:3000/api/notes/3/checklist_items/2

  response:

    OK
