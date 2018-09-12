class Conversation < ApplicationRecord
  has_many :conversation_participations
  has_many :users, through: :conversation_participation
  has_many :messages
end
