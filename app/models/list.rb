class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews
  validates :name, presence: true
  validates :name, uniqueness: true
  has_one_attached :photo
end
