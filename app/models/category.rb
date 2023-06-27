class Category < ApplicationRecord
  validates :name, :slug_url, presence: true
  validates :slug_url, uniqueness: true
  
  has_many :billboards
end
