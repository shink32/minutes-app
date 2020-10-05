class Meeting < ApplicationRecord
  has_many :meeting_users
  has_many :users, through: :meeting_users, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_rich_text :content

  validates :title, presence: true
end
