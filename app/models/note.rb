class Note < ActiveRecord::Base
  include Sortable
  belongs_to :user

  has_many :folds, dependent: :destroy
  has_many :links
  has_many :linked_notes, through: :links

  has_many :checklist_items, dependent: :destroy

  has_many :assets, dependent: :destroy

  accepts_nested_attributes_for :assets, allow_destroy: true

  has_and_belongs_to_many :tags, join_table: 'note_tags'

  has_many :child_notes
end
