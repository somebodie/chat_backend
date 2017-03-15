class User < ApplicationRecord
  # with_options if: :is_admin? do |admin|
  #   has_many :blogs
  # end
  has_many :comments, through: :blogs
end
