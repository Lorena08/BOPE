class Project < ApplicationRecord
  belongs_to :team
  
  has_many :project_sprints, dependent: :destroy
  has_many :sprints, through: :project_sprints
end
