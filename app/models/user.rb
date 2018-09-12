class User < ApplicationRecord
  validates_presence_of :email, :password
  validates :email, uniqueness: true

  has_many :conversation_participations
  has_many :conversations, through: :conversation_participation
  has_many :sent_messages, foreign_key: :user_id, class_name: 'Message'

  has_secure_password
end
