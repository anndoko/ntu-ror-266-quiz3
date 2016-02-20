class Group < ActiveRecord::Base
  has_many :group_users
  has_many :users, through: :group_users 

  # Validation
  validates :group_name, presence: true
  validates :group_name, length: { maximum: 50 }
end