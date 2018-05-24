class GroupDecorator < Draper::Decorator
  delegate_all

  def error_messages
    object.errors.full_messages
  end

  def error_messages_count
    self.error_messages.size
  end

  def show_last_message
    if (last_message = messages.last).present?
      last_message.body? ? last_message.body : '画像が投稿されています'
    else
      'まだメッセージはありません。'
    end
  end

end

