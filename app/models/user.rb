class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  has_many :notes, dependent: :destroy
  has_many :tags, dependent: :destroy

  has_many :child_notes, through: :notes

  def favorite_notes
    notes.where(favorite: true)
  end

  def deleted_notes
    notes.where(deleted: true)
  end

  def notes_and_child_notes
    notes + child_notes
  end

  def find_note_or_child_note(id)
    begin
      @note = notes.find(id)
    rescue ActiveRecord::RecordNotFound
      @note = child_notes.find(id)
    end
  end

  def ensure_or_generate_token
    unless self.auth_token
      loop do
        self.auth_token = SecureRandom.hex
        break if !User.exists?(auth_token: self.auth_token)
      end
      self.save
    end
    self.auth_token
  end

end
