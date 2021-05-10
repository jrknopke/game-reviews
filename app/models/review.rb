class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  validates :content, :title, presence: true

  scope :alpha, -> { order(:title)}
end