class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  # belongs_to :category

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true

  # scope :category_id, ->(category_id) { where category_id: category_id }
end
