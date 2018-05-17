# == Schema Information
#
# Table name: group_users
#
#  id         :bigint(8)        not null, primary key
#  group_id   :bigint(8)        not null
#  user_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :group_id, numericality: { only_integer: true }, presence: true, on: :update
  end
end
