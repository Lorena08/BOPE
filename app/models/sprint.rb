class Sprint < ApplicationRecord
  validates_presence_of :description, :inicio, :fim, :pontos_cadastrados
  has_many :project_sprints, dependent: :destroy
  has_many :projects, through: :project_sprints
end
