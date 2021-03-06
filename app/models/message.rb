# == Schema Information
#
# Table name: messages
#
#  id         :bigint(8)        not null, primary key
#  body       :string(255)      default("")
#  image      :string(255)      default("")
#  group_id   :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :body_or_image, presence: true


  mount_uploader :image, ImageUploader

  private

  def body_or_image
    body.presence || image.presence
  end
end
