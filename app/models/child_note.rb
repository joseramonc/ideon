class ChildNote < ActiveRecord::Base
  belongs_to :note

  validates_presence_of :title
  validates_presence_of :body
  validates_numericality_of :note_id
end
