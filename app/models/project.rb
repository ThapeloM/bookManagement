class Project < ApplicationRecord
  has_many :products_projects
  has_many :products, through: :products_projects
  belongs_to :account

  validates :name, presence: true
  validates :account_id,  presence: true
  validates :description, presence: true
end
