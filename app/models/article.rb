class Article < ApplicationRecord
  validates :title, :content, :category, presence: true

  belongs_to :user
end
