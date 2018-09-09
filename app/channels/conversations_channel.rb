class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation_#{conversationId}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
