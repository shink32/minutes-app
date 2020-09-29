class Meeting < ApplicationRecord
  has_many :meeting_users
  has_many :users, through: :meeting_users, dependent: :destroy
  has_many :contents, dependent: :destroy

  validates :title, presence: true
end
