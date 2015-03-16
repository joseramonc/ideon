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

  def favorite_notes
    notes.where(favorite: true)
  end

  def ensure_or_generate_token
    unless self.auth_token
      loop do
        self.auth_token = SecureRandom.hex
        break if !User.exists?(auth_token: self.auth_token)
      end
      self.save!
    end
  end

end
