class User < ApplicationRecord

  # team members are assigned to a project
  has_and_belongs_to_many :projects

  # an owner can create many projects
  has_many :created_projects, class_name: 'Project'

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
