class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :categories
  has_many :videos
  has_one_attached :photo
  ROLE = ['artist', 'customer']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, presence: true, inclusion: { in: ROLE }
  validates :name, presence: true
end
