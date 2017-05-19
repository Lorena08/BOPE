class Project < ApplicationRecord
  belongs_to :team
  has_many :activities, dependent: :destroy


  has_many :project_sprints, dependent: :destroy
  has_many :sprints, through: :project_sprints

  validates_presence_of :description, :team_id

end
