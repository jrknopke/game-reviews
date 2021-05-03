class User < ApplicationRecord
    has_many :reviews
    has_many :comments
    has_many :commented_reviews, through: :comments, source: :review
    has_secure_password
end
