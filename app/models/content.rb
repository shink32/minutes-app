class Content < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  validates :writing, presence: true
end
