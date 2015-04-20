class Link < ActiveRecord::Base

  belongs_to :note
  belongs_to :linked_note, class_name: "Note"

end
