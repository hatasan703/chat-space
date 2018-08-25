class GroupDecorator < Draper::Decorator
  delegate_all

  def error_messages
    object.errors.full_messages
  end

  def error_messages_count
    self.error_messages.size
  end

  def last_message
    last_message = object.messages.last
    if last_message.present?
      last_message.body.presence || '画像が投稿されています'
    else
      'まだメッセージはありません。'
    end
  end

end
