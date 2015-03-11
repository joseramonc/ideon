class Tag < ActiveRecord::Base
  belongs_to :user
  
  has_and_belongs_to_many :notes, join_table: 'note_tags'
end
