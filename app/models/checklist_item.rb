class ChecklistItem < ActiveRecord::Base
  belongs_to :note

  validates_presence_of :note_id
  validates_presence_of :description

  def fa_checked
    if checked
      'check-square-o'
    else
      'square-o'
    end
  end
end
