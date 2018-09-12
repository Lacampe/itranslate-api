class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :user_id, class_name: 'User'
  belongs_to :conversation
end
