class Account < ApplicationRecord
  belongs_to :user
  has_many :projects

  validates :name, :email, :number, :user_id,  presence: true
  validates :number, length: { is: 10 }
  validates :email, uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
