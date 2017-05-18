class Project < ApplicationRecord
  belongs_to :team
  has_many :activities


  has_many :project_sprints, dependent: :destroy
  has_many :sprints, through: :project_sprints

  validates_presence_of :description

end
