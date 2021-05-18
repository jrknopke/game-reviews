class User < ApplicationRecord
    has_many :reviews
    has_many :comments
    has_many :reviews, through: :comments
    has_secure_password
    validates :username, :email, presence: true
    validates_uniqueness_of :username, :email
end