class User < ApplicationRecord

  # Tell geocoder where to look to get the human-readable address string
  geocoded_by :address

  # Tell geocoder to actually turn the above address into latitude and longtitude GPS coordinates (by doing a lookup in a remote API) any time you create or update a User item


  # team members are assigned to a project
  has_and_belongs_to_many :projects

  # an owner can create many projects
  has_many :created_projects, class_name: 'Project'

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  after_validation :geocode
end
