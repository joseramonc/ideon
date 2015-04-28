class ChildNote < Note
  belongs_to :parent, class_name: "Note"

  validates_presence_of :parent_id
end
