class Project < ApplicationRecord

  # users are assigned to projects
  has_and_belongs_to_many :users

  # one user is the owner of the project (they  created it)
  belongs_to :user, optional: true


  has_many :bugs
end
