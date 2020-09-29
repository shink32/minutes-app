class Content < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_one_attached :image

  validates :writing, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
