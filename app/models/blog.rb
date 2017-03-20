class Blog < ApplicationRecord
  validates :title, uniqueness: true
  has_many :comments, dependent: :destroy
  # validates :current_user, presence: true
  with_options if: :admin? do |admin|
    belongs_to :user
  end
end
