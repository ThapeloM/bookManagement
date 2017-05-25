class Product < ApplicationRecord
  belongs_to :user
  has_many :products_projects
  has_many :projects, through: :products_projects

  validates_presence_of :name, :price, :sku
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  mount_uploader :image, ImageUploader

  validates :image, allow_blank: false, format: {
    with: %r{\.(jpg|png|jpeg|gif)\Z}i,
    message: 'must be a JPG, PNG or GIF image.'
  }

end
