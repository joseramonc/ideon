class Note < ActiveRecord::Base
  include Sortable
  belongs_to :user

  has_and_belongs_to_many :tags, join_table: 'note_tags'
end
