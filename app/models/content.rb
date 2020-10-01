class Content < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_many_attached :images

  validates :writing, presence: true, unless: :was_attached?

  def was_attached?
    images.attached?
  end
end
