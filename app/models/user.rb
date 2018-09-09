class User < ApplicationRecord
  validates_presence_of :email, :password
  validates :email, uniqueness: true

  has_many :conversation_participations
  has_many :conversations, through: :conversation_participation

  has_secure_password

  def self.serialize_all
    User.all.map do |user|
      { id: user.id, email: user.email }
    end
  end
end
