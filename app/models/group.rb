# == Schema Information
#
# Table name: groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  def error_messages_count
    self.error_messages.size
  end

  def error_messages
    self.errors.full_messages
  end

  has_many :group_users
  has_many :users, through: :group_users
  validates :name, uniqueness: true, presence: true
end
