class Billboard < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_one_attached :image
  has_many :impressions, as: :impressionable

  scope :active, -> { where(activated: true) }
end
