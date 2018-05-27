class MessageDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime('%Y/%m/%d/ %H:%M')
  end

  def image_url
    object.image.url
  end

  def image_present
    object.image.present?
  end
end

