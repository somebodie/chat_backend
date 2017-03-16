class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true

  has_secure_password

  with_options if: :is_admin? do |admin|
    has_many :blogs
  end
  
  has_many :comments, through: :blogs
end
