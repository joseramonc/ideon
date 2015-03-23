class Note < ActiveRecord::Base
  belongs_to :user

  has_many :checklist_items
  has_and_belongs_to_many :tags, join_table: 'note_tags'
end
