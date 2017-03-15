class User < ApplicationRecord
  has_many :comments, through: :blogs
  validates_associated :comments
  with_options if: :is_admin? do |admin|
    has_many :blogs
  end
end
