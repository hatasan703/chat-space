# == Schema Information
#
# Table name: groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  validates :name, uniqueness: true, presence: true
end
