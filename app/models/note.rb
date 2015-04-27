class Note < ActiveRecord::Base
  include Sortable
  before_destroy :remove_linked

  belongs_to :user

  has_many :folds, dependent: :destroy

  has_many :links, dependent: :destroy
  has_many :linked_notes, through: :links

  has_many :checklist_items, dependent: :destroy

  has_many :assets, dependent: :destroy

  accepts_nested_attributes_for :assets, allow_destroy: true

  has_and_belongs_to_many :tags, join_table: 'note_tags'

  has_many :child_notes, class_name: 'Note', foreign_key: 'parent_id', dependent: :destroy

  scope :search, -> (search) do
    where(
      'title LIKE :search OR body LIKE :search',
      search: "%#{search}%"
    )  
  end

  private

    def remove_linked
      Link.where(linked_note: self.id).destroy_all
    end

end
