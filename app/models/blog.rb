class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy
  with_options if: :is_admin? do |admin|
    belongs_to :user
  end
end
