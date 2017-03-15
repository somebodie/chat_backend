class Blog < ApplicationRecord
  validates :title, presence: true,
                  length: { minimum: 5 }
  has_many :comments, dependent: :destroy
  # validates :current_user, presence: true
  with_options if: :is_admin? do |admin|
    belongs_to :user
  end
end
