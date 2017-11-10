class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

end
