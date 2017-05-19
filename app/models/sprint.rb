class Sprint < ApplicationRecord
  validates_presence_of :description

  has_many :project_sprints, dependent: :destroy
  has_many :projects, through: :project_sprints
  has_many :activities, dependent: :destroy

  validates_presence_of :description, :inicio, :fim

end
