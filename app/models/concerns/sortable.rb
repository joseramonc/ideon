module Sortable
  extend ActiveSupport::Concern

  included do
    before_create :set_position
    before_destroy :rearrange_positions

    default_scope do
      ordered
    end
  end

  module ClassMethods
    def ordered
      order('position ASC')
    end

    def in_better_position(current_position, new_position, user_id)
      where(
        'position >= ? AND position < ?',
        new_position,
        current_position
      ).where(
        user_id: user_id
      )
    end

    def in_worst_position(current_position, new_position, user_id)
      where(
        'position > ? AND position <= ?',
        current_position,
        new_position
      ).where(
        user_id: user_id
      )
    end
  end

  def move_to_position(new_position)
    if new_position < position
      self.class.in_better_position(
        self.position,
        new_position,
        self.user_id
      ).update_all('position = position + 1')
    else
      # search for worster elements and upgrade them
      self.class.in_worst_position(
        self.position,
        new_position,
        self.user_id
      ).update_all('position = position - 1')
    end
    self.update(position: new_position)
  end

  protected

    def rearrange_positions
      self.class.where(
        user_id: self.user_id
      ).where(
        'position > ?',
        self.position
      ).update_all('position = position - 1')
    end

    def set_position
      last_record = self.class.where(
        user_id: self.user_id
      ).ordered.last
      if last_record.nil?
        self.position = 1
      else
        self.position = last_record.position + 1
      end
    end
end
