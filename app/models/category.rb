class Category < ApplicationRecord
  belongs_to :user
  has_many :videos

  validates :title, :price, presence: true
end
