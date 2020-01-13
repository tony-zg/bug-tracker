class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
