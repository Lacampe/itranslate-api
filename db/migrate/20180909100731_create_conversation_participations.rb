class CreateConversationParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversation_participations do |t|
      t.references :user, foreign_key: true, index: true
      t.references :conversation, foreign_key: true, index: true

      t.timestamps
    end
  end
end
