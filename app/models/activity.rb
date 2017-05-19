class Activity < ApplicationRecord
  belongs_to :status
  belongs_to :label
  belongs_to :sprint
  belongs_to :project

  validates_presence_of :description, :project_id, :sprint_id

end
