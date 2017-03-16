class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  with_options if: :admin? do |admin|
    has_many :blogs
  end
  has_many :comments, through: :blogs
  has_secure_password
end
